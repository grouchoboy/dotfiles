function isOnCurrentDesktop(client) {
    // Check if window is on all desktops
    if (client.onAllDesktops) {
        return true;
    }
    
    // Get the window's desktops and check if current desktop is included
    const currentDesktop = workspace.currentDesktop;
    return client.desktops.includes(currentDesktop);
}

function getFocusableWindows() {
    return workspace.stackingOrder.filter(client => 
        client.normalWindow &&
        !client.minimized &&
        isOnCurrentDesktop(client)
        // client.desktop === workspace.currentDesktop
    );
}

function findWindowToRight(currentWindow, windows) {
    // Sort windows by x coordinate
    const sortedWindows = windows.sort((a, b) => a.x - b.x);
    
    // Find current window index
    const currentIndex = sortedWindows.indexOf(currentWindow);
    
    if (currentIndex === -1 || currentIndex === sortedWindows.length - 1) {
        // If current window not found or is rightmost, wrap to leftmost
        return sortedWindows[0];
    }
    
    return sortedWindows[currentIndex + 1];
}

function findWindowToLeft(currentWindow, windows) {
    // Sort windows by x coordinate
    const sortedWindows = windows.sort((a, b) => b.x - a.x);
    
    // Find current window index
    const currentIndex = sortedWindows.indexOf(currentWindow);
    
    if (currentIndex === -1 || currentIndex === sortedWindows.length - 1) {
        // If current window not found or is rightmost, wrap to leftmost
        return sortedWindows[0];
    }
    
    return sortedWindows[currentIndex + 1];
}



function focusWindow(direction) {
    const activeWindow = workspace.activeWindow;
    // if (!activeWindow) return;
    if (!activeWindow) {
        return;
    }
    
    const focusableWindows = getFocusableWindows();
    if (focusableWindows.length <= 1) 
    {
        return;
    }
    
    let nextWindow = null;
    if (direction === "right") {
        nextWindow = findWindowToRight(activeWindow, focusableWindows);
    } else {
        nextWindow = findWindowToLeft(activeWindow, focusableWindows);
    }
    if (nextWindow) {
        workspace.activeWindow = nextWindow;
    } 
}

// Bind the script to shortcuts
registerShortcut(
    "FocusRightWindow",
    "Focus Right Window",
    "Meta+L",
    () => focusWindow("right")
);

registerShortcut(
    "FocusLeftWindow",
    "Focus Left Window",
    "Meta+H",
    () => focusWindow("left")
);
