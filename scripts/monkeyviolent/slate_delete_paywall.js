// ==UserScript==
// @name        Delete paywall
// @namespace   Violentmonkey Scripts
// @match       *://*.slate.fr/*
// @grant       none
// @version     1.0
// @author      kalak
// @description 12/15/2024, 10:10:42 PM
// ==/UserScript==


function deletePaywall() {
    const element = document.querySelector('#vp_popup_wall');
    console.log(element)
    if (element) {
        element.remove();
    }
}

function onMountElement(selector, onMount) {
  if (document.querySelector(selector)) onMount(document.querySelector(selector))

  const observer = new MutationObserver((mutationsList) => {
    mutationsList.forEach((mutation) => {
      // Check for added nodes (Mount)
      mutation.addedNodes.forEach((node) => {
        if (node.querySelector && node.querySelector(selector)) onMount(document.querySelector(selector))
      });
    });
  });

  // Start observing the document body for child list changes
  observer.observe(document.body, { childList: true, subtree: true });

  return observer;
}

async function main() {
  onMountElement('#vp_popup_wall', deletePaywall)
}

main()
