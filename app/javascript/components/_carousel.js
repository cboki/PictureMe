import { tns } from "tiny-slider/src/tiny-slider"

const carousel = () => {
  const slider = tns({
    container: '#carousel1',
    items: 1,
    slideBy: 'page',
    autoplay: true,
    nav: false,
    controls:false,
    autoplayButtonOutput: false,
    mouseDrag:true,

  });
}

// export { carousel };


const carousel2 = () => {
  const slider2 = tns({
    container: '#carousel2',
    items: 2,
    slideBy: 'page',
    autoplay: true,
    nav: false,
    controls:false,
    autoplayButtonOutput: false,
    mouseDrag:true,

  });
}

export { carousel, carousel2 };
