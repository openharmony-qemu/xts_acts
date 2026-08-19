import router from '@system.router';

export default {
  data: {
    listData: [],
  },
  onInit() {
    for (let i = 0; i < 10; i++) {
      this.listData.push('/common/icon.png');
      this.listData.push('/common/icon.png');
      this.listData.push('/common/icon.png');
      this.listData.push('/common/icon.png');
      this.listData.push('/common/icon.png');
      this.listData.push('/common/icon.png');
    }
  },

  scrollEnd(endState, endComponentIndex) {
    console.log(
      'list onscrollend is triggered, end component index=' + endComponentIndex
    );
  },
  listClick() {
    console.log('list onclick is triggered');
  },

    helpClicked() {
        getApp().data.helpData = { step: '在方框内上下滑动', result: '方框中的元素随滑动变化', url: 'pages/ArkUI/list-item/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.list_item.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.list_item.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
