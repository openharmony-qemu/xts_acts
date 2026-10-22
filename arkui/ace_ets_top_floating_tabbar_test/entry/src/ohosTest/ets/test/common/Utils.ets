import router from '@ohos.router';

export default class Utils {
  static sleep(time: number): Promise<void> {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('ok');
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  static async pushPage(pageTag: string, done?: Function): Promise<void> {
    let options: router.RouterOptions = {
      url: `MainAbility/pages/${pageTag}`,
    };
    try {
      router.clear();
      let pages = router.getState();
      console.info(`[pushPage] get ${pageTag} state: ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`[pushPage] current page: ` + JSON.stringify(pages.name));
        let result = await router.pushUrl(options);
        await Utils.sleep(2000);
        console.info(`[pushPage] push ${pageTag} success: ` + JSON.stringify(result));
      }
    } catch (err) {
      console.error(`[pushPage] push ${pageTag} error: ` + err);
    }
    if (done) {
      done();
    }
  }
}
