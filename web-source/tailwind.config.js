/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
    theme: {
        extend: {
            backgroundImage: {
                bgradient:
                    "radial-gradient(circle, #3b82f6, #347af4, #2e73f1, #296bee, #2563eb)",
            },
            colors: {
                primary: "rgba(2, 6, 16, 1)",
                secondary: "rgba(77, 75, 89, 0.8)",
                tertiary: "rgba(255, 255, 255, 0.1)",
                quaternary: "rgba(77, 75, 89, 0.8)",
                bPrimary: "rgba(77, 75, 89, 0.4)",
                bSecondary: "rgba(77, 75, 89, 0.8)",
                pText: "#f4f4f4",
                sText: "#b3b3b3",
                brandB: "#3b82f6",
                brandR: "#ef4444",
                brandY: "#9a7b20",
                brandG: "#22c55e",
            },
        },
    },
    plugins: [],
};
