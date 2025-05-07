import { useEffect, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { fetchNui } from "../utils/fetchNui";
import { debugData } from "../utils/debugData";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Placeholder from "../assets/placeholder.png";
import { Tooltip } from "react-tooltip";

debugData([
    {
        action: "MENU",
        data: {
            visible: true,
            categories: ["Kartik Scripts", "Cadburry Scripts", "Snappy Scripts", "Exclusive Wheels", "UT MODZ"],
            list: [
                {
                    id: "carrypeople",
                    title: "Carry People Put In Trunk/Seat",
                    category: "Cadburry Scripts",
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
    const [categories, setCategories] = useState<any>([]);
    const [category, setCategory] = useState<string[]>([]);
    const [list, setList] = useState<any>([]);
    const [filteredList, setFilteredList] = useState<any>([]);
    const [search, setSearch] = useState("");
    const debouncedSearch = useDebounce(search, 500);

    useNuiEvent("MENU", (data) => {
        setVisible(data.visible);
        setList(data.list);
        setCategories(data.categories);
        setCategory(data.categories);
    });

    useEffect(() => {
        const filtered =
        list &&
        list.filter((list: any) => {
            const matchesSearch =
                list.title.toLowerCase().includes(search) ||
                list.description.toLowerCase().includes(search);
            const matchesCategory =
                category.length === 0 || category.includes(list.category);
            return matchesSearch && matchesCategory;
        });
        setFilteredList(filtered);
    }, [debouncedSearch, list, category]);

    const toggleCategory = (categoryName: string) => {
        setCategory((prev: any) =>
            prev.includes(categoryName)
                ? prev.filter((cat: any) => cat !== categoryName)
                : [...prev, categoryName]
        );
    };

    const buttonClicked = (type: any, id: string | number) => {
        fetchNui("buttonClicked", { id: id, type: type });
    };

    const handleSearch = (event: React.ChangeEvent<HTMLInputElement>) => {
        const search = event.target.value.toLowerCase();
        setSearch(search);
    };

    const onClose = async () => {
        await fetchNui("closeMenu");
        setVisible(false);
    };

    return (
        <div className={`flex w-screen h-screen ${visible ? "visible" : "hidden"} z-99`}>
            <div className="flex flex-col w-full bg-primary/90 items-center p-2 m-2 rounded-lg drop-shadow-md">
                {/* Header Row */}
                <div className="flex w-full justify-between items-center gap-2 p-2">
                    {/* Category Options */}
                    <div className="flex px-2 py-2 border-white border-1 bg-tertiary justify-start items-center rounded-lg gap-2 text-sText">
                        <div className="text-sText text-lg px-2 py-1 shadow-sm">Categories:</div>
                        {categories &&
                            categories.map((categoryName: any) => (
                                <div
                                    key={categoryName}
                                    className={`flex px-4 py-1 hover:bg-brandB text-pText items-center gap-2 rounded-xl cursor-pointer ${
                                        category.includes(categoryName) ? "bg-brandB" : "bg-tertiary"
                                    }`}
                                    onClick={() => toggleCategory(categoryName)}
                                >
                                    {categoryName}
                                </div>
                            ))}
                    </div>
                    <div className="flex gap-2 items-center">
                        {/* Search Box */}
                        <div className="flex py-3 border-white border-1 bg-tertiary justify-center items-center rounded-lg gap-2 text-sText">
                            <input
                                type="text"
                                maxLength={40}
                                id="searchList"
                                onChange={handleSearch}
                                placeholder="Search Script..."
                                autoComplete="off"
                                spellCheck="false"
                                className="w-full h-full bg-transparent mx-2 border-none outline-none"
                            />
                        </div>
                        {/* Close Box */}
                        <div className="flex p-3 border-white border-1 bg-tertiary justify-center items-center rounded-lg gap-2 text-sText"
                         data-tooltip-id="previewer" data-tooltip-content={"Close Previewer"}>
                            <FontAwesomeIcon icon={'xmark'} className="text-sText hover:text-pText text-lg cursor-pointer" onClick={onClose} />
                        </div>
                    </div>
                </div>
                {/* List of items */}
                <div className="grid grid-cols-3 w-full px-2 justify-center items-center overflow-auto gap-2 mb-2">
                    {filteredList &&
                        filteredList.map((list: any) => (
                            <div
                                key={list.id}
                                className="flex flex-row w-full bg-tertiary hover:bg-tertiary/20 drop-shadow-md items-center justify-between rounded-lg mt-1 py-2"
                            >
                                <div className="h-full w-[40%] justify-center items-center aspect-square p-2">
                                    <img className="w-full h-full bg-tertiary rounded-md shadow-md" src={list.image || Placeholder} />
                                </div>
                                <div className="flex flex-col w-[60%] justify-between items-center px-2 py-2">
                                    <div className="text-pText text-center text-2xl select-none">
                                        {list.title}
                                    </div>
                                    <div className="text-sText text-center text-sm mx-2 line-clamp-2 select-none">
                                        {list.description}
                                    </div>
                                    <div className="flex flex-wrap items-center justify-center my-4 gap-2 select-none">
                                        <div
                                            className={`flex px-4 py-1 bg-brandG hover:bg-[#2b894d] text-pText items-center gap-2 rounded-lg cursor-pointer ${
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
                                            className={`flex px-4 py-1 bg-brandB hover:bg-[#3168c1] text-pText items-center gap-2 rounded-lg cursor-pointer ${
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
                                            className={`flex px-4 py-1 bg-brandR hover:bg-[#a32f2f] text-pText items-center gap-2 rounded-lg cursor-pointer ${
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
                            </div>
                        ))}
                </div>
            </div>
            <Tooltip id="previewer" />
        </div>
    );
};
export default App;
