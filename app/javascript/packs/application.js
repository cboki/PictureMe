import "bootstrap";
import { loadDynamicBannerText } from '../components/_banner';
import { initTransparentNavbarOnScroll } from '../components/_navbar';
import '../components/_inbox';
import './application.css'
import { datePicker } from '../components/_datepicker';

initTransparentNavbarOnScroll();


const new_appointment = document.querySelector('.appointments.new')
if (new_appointment) {
  datePicker();
}

const landing_page = document.querySelector('.pages.home')
if (landing_page) {
  loadDynamicBannerText();
}

