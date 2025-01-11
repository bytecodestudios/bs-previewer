import { useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { debugData } from "../utils/debugData";
import Logo from "../assets/logo.png"

interface IMessages {
    visible: boolean
    align: string
    messages: string[]
}

debugData([
    {
        action: "MESSAGE",
        data: {
            visible: false,
            align: "top-middle",
            messages: [ "[F5] vMenu", "[F6] Noclip", "[H] Showcase Menu" ]   
        },
    },
]);

const Message = () => {
    const [visible, setVisible] = useState<boolean>(false);
    const [align, setAlign] = useState<string>("top-middle")
    const [messages, setMessages] = useState<string[]>();

    const alignments: any = {
        "top-middle": "justify-center",
        "top-left": "justify-start",
        "top-right": "justify-end",
        "bottom-middle": "justify-center items-end",
        "bottom-left": "justify-start items-end",
        "bottom-right": "justify-end items-end",
    }

    useNuiEvent('MESSAGE', (response: IMessages) => {
        setVisible(response.visible)
        if (alignments[response.align]) setAlign(alignments[response.align]);
        if (response.messages != null) setMessages(response.messages);
    })

    const renderMessage = (text: string) => {
        const parts = text.match(/\[.*?\]|[^\[\]]+/g) || [];
        
        return (
            <div className="flex">
                {parts.map((part, index) => {
                    if (part.startsWith('[') && part.endsWith(']')) {
                        return <span key={index} className="font-bold text-brandB bg-secondary rounded-sm px-2">{part.slice(1, -1)}</span>;
                    }
                    return <span key={index} className="px-2">{part}</span>;
                })}
            </div>
        );
    };

    return (
        <div className={`flex w-screen h-screen z-1 ${visible ? 'visible' : 'hidden'}`}>
            <div className="absolute top-0 right-0 px-4">
                <img src={Logo} className="w-24 h-24"></img>
            </div>
            <div className={`flex w-full h-full gap-2 p-4 ${align}`}>
                {messages?.map((message, index) => (
                    <div key={index} className="flex h-fit bg-primary gap-2 text-lg text-white text-center shadow-md rounded-sm p-2">
                        {renderMessage(message)}
                    </div>
                ))}
            </div>
        </div>
    );
};

export default Message;
