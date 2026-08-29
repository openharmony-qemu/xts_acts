export default {
  data: {
    testItems: {
      'text_largeColor': { cat: 'text', status: 'null' },
      'image_display': { cat: 'image', status: 'null' },
      'progress_bar': { cat: 'progress', status: 'null' },
      'slider_drag': { cat: 'slider', status: 'null' },
      'switch_toggle': { cat: 'switch', status: 'null' },
      'chart_bar_complex': { cat: 'chart', status: 'null' },
      'chart_line': { cat: 'chart', status: 'null' },
      'image_animator': { cat: 'component', status: 'null' },
      'input': { cat: 'component', status: 'null' },
      'list_item': { cat: 'component', status: 'null' },
      'event_longpress': { cat: 'component', status: 'null' },
      'event_swipe': { cat: 'component', status: 'null' },
      'marquee': { cat: 'component', status: 'null' },
      'opacity': { cat: 'component', status: 'null' },
      'picker_view': { cat: 'component', status: 'null' },
      'qrcode': { cat: 'component', status: 'null' },
      'swiper': { cat: 'component', status: 'null' },
      'transition': { cat: 'component', status: 'null' },
      'api_app': { cat: 'api', status: 'null' },
      'api_configuration': { cat: 'api', status: 'null' },
      'api_timer_timeout': { cat: 'api', status: 'null' },
      'api_timer_interval': { cat: 'api', status: 'null' },
      'api_storage': { cat: 'api', status: 'null' },
      'api_file': { cat: 'api', status: 'null' },
      'api_deviceinfo': { cat: 'api', status: 'null' },
      'api_brightness_value': { cat: 'api', status: 'null' },
      'api_brightness_mode': { cat: 'api', status: 'null' },
      'api_battery': { cat: 'api', status: 'null' },
      'api_nfc': { cat: 'api', status: 'null' }
    }
  },
  onCreate() {
    console.info('[start] start run suites');
  },
  onDestroy() {
    console.info('[end] run suites end');
  }
}
