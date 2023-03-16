let mouseCursor = document.querySelector(".cursor");

window.addEventListener("mousemove", cursor);

function cursor(e) {
    mouseCursor.style.top = e.pageY + "px";
    mouseCursor.style.left = e.pageX + "px";
}

// GSAP Animations
gsap.registerPlugin(ScrollTrigger);
gsap.registerPlugin(CSSPlugin);

var t1 = gsap.timeline();

gsap.to(".scroll-down", {
    scrollTrigger: {
        trigger: ".scroll-down",
        start: "top center",
        scrub: true,
        end: "+=100",
        markers: true,
    },
    opacity: 0,
    duration: 0.1,
});
t1.from(".logo-container", {
    opacity: 0,
    y: -30,
    duration: 1,
    ease: "Power4.easeInOut",
})
    .from(
        ".nav-links",
        {
            opacity: 0,
            y: -30,
            duration: 1,
            ease: "Power4.easeInOut",
        },
        "-=1"
    )
    .from(
        ".hide-text",
        { y: "100%", stagger: 0.6, ease: "Power4.easeInOut" },
        "-=0.7"
    )
    .from(".line-inner-2", { opacity: 0, x: -40, ease: "Power4.easeInOut" })
    .from(
        ".resume-btn",
        { opacity: 0, y: 20, ease: "Power4.easeInOut" },
        "-=0.5"
    );

gsap.from(".menu", {
    scrollTrigger: {
        trigger: ".logo-container",
        start: "bottom top",
        end: "+=100",
        scrub: 0.2,
    },
    opacity: 0,
    x: -60,
});

gsap.to(".menu-bar", {
    scrollTrigger: {
        trigger: ".project-section",
        start: "top center",
        end: "top center",
        scrub: true,
    },
    backgroundColor: "#fff",
});

var t2 = gsap.timeline({
    scrollTrigger: {
        trigger: ".work-section",
        start: "top center",
        end: "top 50px",
        scrub: true,
    },
});

t2.from(".line-inner3", { opacity: 0.5, y: 40, duration: 2, stagger: 1 });
