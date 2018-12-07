import "bootstrap";
import { loadDynamicBannerText } from '../components/_banner';
import { initTransparentNavbarOnScroll } from '../components/_navbar';
import '../components/_inbox';
import './application.css'
import { datePicker } from '../components/_datepicker';
import { carousel, carousel2 } from '../components/_carousel';

initTransparentNavbarOnScroll();
carousel();
carousel2();


const new_appointment = document.querySelector('.photographers.show')
if (new_appointment) {
  datePicker();
}

const landing_page = document.querySelector('.pages.home')
if (landing_page) {
  loadDynamicBannerText();
}

