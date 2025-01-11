import { useEffect, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { fetchNui } from "../utils/fetchNui";
import { debugData } from "../utils/debugData";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

debugData([
    {
        action: "MENU",
        data: {
            visible: true,
            list: [
                {
                    id: "carrypeople",
                    title: "Carry People Put In Trunk/Seat",
                    description:
                        "This is really awesome resource where you can carry people and put them in trunk or in nearby seat",
                    purchase: "https://cadburry.tebex.io/package/5700480",
                    buttons: {
                        location: true,
                        action: true
                    },
                },
            ],
        },
    },
]);

export function useDebounce<T>(value: T, delay: number = 500): T {
    const [debouncedValue, setDebouncedValue] = useState<T>(value);

    useEffect(() => {
        const timer = setTimeout(() => {
            setDebouncedValue(value);
        }, delay);

        return () => {
            clearTimeout(timer);
        };
    }, [value, delay]);

    return debouncedValue;
}

const App = () => {
    const [visible, setVisible] = useState(false);
    const [list, setList] = useState<any>([]);
    const [filteredList, setFilteredList] = useState<any>([]);
    const [search, setSearch] = useState("");
    const debouncedSearch = useDebounce(search, 500);

    useNuiEvent("MENU", (data) => {
        setVisible(data.visible);
        setList(data.list);
    });

    useEffect(() => {
        const filtered =
            list &&
            list.filter((list: any) => {
                return (
                    list.title.toLowerCase().includes(search) ||
                    list.description.toLowerCase().includes(search)
                );
            });
        setFilteredList(filtered);
    }, [debouncedSearch, list]);

    const buttonClicked = (type: any, id: string | number) => {
        fetchNui("buttonClicked", { id: id, type: type });
    };

    const handleSearch = (event: React.ChangeEvent<HTMLInputElement>) => {
        const search = event.target.value.toLowerCase();
        setSearch(search);
    };

    return (
        <div className={`flex w-screen h-screen justify-between ${visible ? "visible" : "hidden"} z-10`}>
            <div className="flex w-[30%]"></div>
            <div className="flex flex-col w-[30%] bg-primary items-center py-2">
                <div className="flex w-[90%] py-2 border-white border-1 bg-tertiary justify-center items-center rounded-lg gap-2 text-sText">
                    <input
                        type="text"
                        maxLength={40}
                        id="searchList"
                        onChange={handleSearch}
                        placeholder="Search"
                        autoComplete="off"
                        spellCheck="false"
                        className="w-full h-full bg-transparent mx-2 border-none outline-none"
                    />
                </div>
                <div className="flex flex-col items-center overflow-auto py-1">
                    {filteredList &&
                        filteredList.map((list: any) => (
                            <div
                                key={list.id}
                                className="flex flex-col w-[90%] bg-tertiary hover:bg-tertiary/20 drop-shadow-md items-center rounded-lg mt-3 py-2"
                            >
                                <div className="text-pText text-center text-2xl select-none">
                                    {list.title}
                                </div>
                                <div className="w-[90%] text-sText text-center text-sm line-clamp-2 select-none">
                                    {list.description}
                                </div>
                                <div className="flex my-4 gap-2 select-none">
                                    <div
                                        className={`flex px-4 py-1 bg-brandG hover:bg-[#2b894d] text-pText items-center gap-2 rounded-xl cursor-pointer ${
                                            list.buttons && list.buttons.action
                                                ? "visible"
                                                : "hidden"
                                        }`}
                                        onClick={() =>
                                            buttonClicked("action", list.id)
                                        }
                                    >
                                        <FontAwesomeIcon icon="play" />
                                        <div>Test Now</div>
                                    </div>
                                    <div
                                        className={`flex px-4 py-1 bg-brandB hover:bg-[#3168c1] text-pText items-center gap-2 rounded-xl cursor-pointer ${
                                            list.buttons &&
                                            list.buttons.location
                                                ? "visible"
                                                : "hidden"
                                        }`}
                                        onClick={() =>
                                            buttonClicked("location", list.id)
                                        }
                                    >
                                        <FontAwesomeIcon icon="location" />
                                        <div>Location</div>
                                    </div>
                                    <div
                                        className={`flex px-4 py-1 bg-brandR hover:bg-[#a32f2f] text-pText items-center gap-2 rounded-xl cursor-pointer ${
                                            list.purchase
                                                ? "visible"
                                                : "hidden"
                                        }`}
                                        onClick={() =>
                                            (window as any).invokeNative("openUrl", list.purchase)
                                        }
                                    >
                                        <FontAwesomeIcon icon="cart-shopping" />
                                        <div>Purchase</div>
                                    </div>
                                </div>
                            </div>
                        ))}
                </div>
            </div>
        </div>
    );
};
export default App;
