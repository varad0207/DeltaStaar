const Overlay = {
    init() {

        document.body.addEventListener("click", e => {
            if (e.target.classList.contains("close")) {
                closeOverlay(e.target);
            }
        });
        
    }
    
};

function closeOverlay(closeButton) {
    const windowOverlay = closeButton.parentElement.parentElement.parentElement;
    document.body.removeChild(windowOverlay);
}

document.addEventListener("DOMContentLoaded", () =>  Overlay.init());
