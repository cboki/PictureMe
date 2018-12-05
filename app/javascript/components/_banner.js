import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Keep this empty", "Pictures of yourself.", "Anywhere!", "Every Angle!"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
