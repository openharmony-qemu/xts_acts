import router from '@system.router';
import app from '@system.app';

export default {
  data: {
    passCount: 0,
    failCount: 0,
    untestedCount: 0,
    reportBtnText: 'Generate Report'
  },
  onShow() {
    this.refreshSummary();
  },
  swipeEvent(e) {
    if (e.direction === 'right') {
      app.terminate();
    }
  },
  refreshSummary() {
    let items = getApp().data.testItems;
    let pass = 0;
    let fail = 0;
    let untested = 0;
    for (let key in items) {
      let s = items[key].status;
      if (s === 'pass') {
        pass++;
      } else if (s === 'fail') {
        fail++;
      } else {
        untested++;
      }
    }
    this.passCount = pass;
    this.failCount = fail;
    this.untestedCount = untested;
  },
  navigateTo(subsystem) {
    let routes = {
      'ArkUI': 'pages/ArkUI/common/index/index',
                  'PowerManager': 'pages/PowerManager/common/index/index',
      'FileManagement': 'pages/FileManagement/file/index',
      'DistributedData': 'pages/DistributedData/storage/index',
      'Startup': 'pages/Startup/deviceInfo/index',
      'Communication': 'pages/Communication/nfc/index'
    };
    let url = routes[subsystem] || 'pages/index/index';
    router.replace({ uri: url });
  },
  generateReport() {
    if (this._reporting) {
      return;
    }
    this._reporting = true;
    this.reportBtnText = 'Generating...';
    let items = getApp().data.testItems;
    let passCount = 0;
    let failCount = 0;
    let totalCount = 0;
    let keys = [];
    for (let key in items) {
      keys.push(key);
      let status = items[key].status;
      if (status === 'pass') {
        passCount++;
      } else if (status === 'fail') {
        failCount++;
      }
      totalCount++;
    }
    console.info('[report_start]');
    this._outputReportLines(items, keys, 0, passCount, failCount, totalCount);
  },
  _outputReportLines(items, keys, index, passCount, failCount, totalCount) {
    if (index >= keys.length) {
      let totalLine = '[total] ' + totalCount + ' ' + passCount + ' ' + failCount;
      console.info(totalLine);
      console.info('[end]');
      console.info('[report_end]');
      app.terminate();
      return;
    }
    let key = keys[index];
    let status = items[key].status;
    let reportStatus = (status === 'pass' || status === 'fail') ? status : 'untested';
    let reportLine = '[report] ' + key + ' ' + reportStatus;
    let errorDetail = items[key].errorDetail || '';
    if (errorDetail) {
      reportLine += ' ' + errorDetail;
    }
    console.info(reportLine);
    let self = this;
    setTimeout(function() {
      self._outputReportLines(items, keys, index + 1, passCount, failCount, totalCount);
    }, 500);
  },
}
