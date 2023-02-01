document.getElementById("cookie-consent-agree").addEventListener("click", function() {
    document.getElementById("cookie-consent").style.display = "none";
    document.cookie = "cookie-consent=true; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/";
});

if (document.cookie.indexOf("cookie-consent=true") === -1) {
    document.getElementById("cookie-consent").style.display = "flex";
} else {
    document.getElementById("cookie-consent").style.display = "none";
}