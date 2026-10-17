import router from '@system.router';

export default {
  data: {
    itemIndex: 0,
    todolist: [
      { id: 0, title: 'Sensors', url: 'pages/Sensors/sensors/index/index' },
      { id: 1, title: 'WorkoutSensors', url: 'pages/Sensors/workoutSensors/index/index' },
      { id: 8, title: '返回首页', url: 'pages/index/index' },
    ]
  },

  onShow() {
  },

  clickChange(item) {
    router.replace({
      uri: item.url,
      params: {
        itemIndex: item.id
      }
    });
  },

  swipeEvent(e) {
    if (e.direction === 'right') {
      router.replace({ uri: 'pages/index/index' });
    }
  },
};
