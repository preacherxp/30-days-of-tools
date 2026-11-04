// One entry per shipped day. Add the next tool here and push; the calendar fills itself in.
// fit: "contain" for screenshots on a white backdrop, "cover" for full bleed images.
window.TOOLS = [
  {
    day: 1,
    name: "OpenCode Answer",
    repo: "preacherxp/opencode-answer",
    blurb: "A macOS menu bar app for answering OpenCode's questions without switching to the terminal.",
    stack: "Swift · macOS",
    image: "assets/opencode-answer.png",
    fit: "contain",
  },
  {
    day: 2,
    name: "Flokque Aloft",
    repo: "preacherxp/flokque-aloft",
    blurb: "Keeps your computer working with the lid closed, so agents and builds carry on in your bag.",
    stack: "Rust · macOS, Linux, Windows",
    image: "assets/flokque-aloft.png",
    fit: "contain",
  },
  {
    day: 3,
    name: "Element Snap",
    repo: "preacherxp/element-snap",
    blurb: "A Chrome extension that saves any element on a web page as a pixel exact image.",
    stack: "JavaScript · Chrome",
    image: "assets/element-snap.png",
    fit: "cover",
  },
  {
    day: 4,
    name: "Sieve",
    repo: "preacherxp/sieve",
    blurb: "Runs only the JVM tests a change can affect. When unsure, it runs them all.",
    stack: "Rust · Maven, Gradle",
    image: "assets/sieve.svg",
    fit: "contain",
  },
];
