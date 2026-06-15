/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';


export default function xmlTest1() {
  describe('xmlTest1', (): void => {
           
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0100
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0100
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(25));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton0'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton0==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=25&bar=915');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0200
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0200
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(276));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton1'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton1==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=276&bar=847');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200004)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0300
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0300
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(745));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton2'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton2==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=745&bar=734');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200006)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0400
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0400
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(473));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton3'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton3==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=473&bar=760');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200008)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0500
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0500
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(363));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton4'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton4==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=363&bar=663');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200010)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0600
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0600
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(201));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton5'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton5==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=201&bar=483');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200012)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0700
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0700
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(775));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton6'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton6==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=775&bar=52');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200014)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0800
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0800
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(910));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton7'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton7==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=910&bar=597');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200016)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0900
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0900
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(470));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton8'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton8==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=470&bar=274');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200018)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1000
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1000
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(599));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton9'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton9==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=599&bar=996');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200020)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1100
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1100
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(560));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton10'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton10==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=560&bar=807');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200022)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1200
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1200
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(27));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton11'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton11==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=27&bar=34');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200024)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1300
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1300
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(434));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton12'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton12==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=434&bar=490');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200026)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1400
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1400
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(902));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton13'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton13==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=902&bar=25');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200028)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1500
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1500
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(825));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton14'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton14==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=825&bar=524');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200030)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1600
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1600
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(675));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton15'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton15==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=675&bar=522');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200032)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1700
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1700
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(1));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton16'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton16==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=1&bar=867');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200034)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1800
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1800
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(245));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton17'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton17==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=245&bar=627');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200036)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_1900
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_1900
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(357));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton18'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton18==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=357&bar=652');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200038)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2000
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2000
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(881));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton19'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton19==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=881&bar=956');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200040)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2100
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2100
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(473));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton20'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton20==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=473&bar=544');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200042)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2200
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2200
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(891));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton21'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton21==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=891&bar=178');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200044)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2300
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2300
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(891));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton22'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton22==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=891&bar=513');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200046)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2400
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2400
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(968));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton23'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton23==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=968&bar=579');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200048)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2500
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2500
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(220));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton24'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton24==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=220&bar=34');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200050)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2600
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2600
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(41));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton25'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton25==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=41&bar=320');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200052)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2700
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2700
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(314));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton26'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton26==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=314&bar=545');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200054)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2800
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2800
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(223));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton27'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton27==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=223&bar=490');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200056)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_2900
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_2900
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(332));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton28'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton28==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=332&bar=563');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200058)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3000
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3000
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(809));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton29'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton29==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=809&bar=745');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200060)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3100
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3100
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(496));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton30'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton30==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=496&bar=809');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200062)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3200
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3200
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(670));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton31'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton31==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=670&bar=670');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200064)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3300
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3300
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(683));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton32'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton32==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=683&bar=768');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200066)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3400
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3400
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(33));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton33'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton33==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=33&bar=623');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200068)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3500
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3500
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(40));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton34'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton34==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=40&bar=977');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200070)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3600
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3600
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(658));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton35'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton35==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=658&bar=908');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200072)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3700
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3700
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(474));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton36'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton36==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=474&bar=923');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200074)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3800
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3800
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(397));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton37'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton37==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=397&bar=823');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200076)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_3900
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_3900
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(204));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton38'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton38==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=204&bar=734');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200078)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4000
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4000
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(297));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton39'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton39==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=297&bar=320');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200080)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4100
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4100
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(146));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton40'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton40==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=146&bar=233');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200082)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4200
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4200
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(276));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton41'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton41==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=276&bar=861');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200084)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4300
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4300
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(274));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton42'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton42==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=274&bar=959');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200086)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4400
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4400
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(840));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton43'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton43==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=840&bar=686');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200088)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4500
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4500
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(804));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton44'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton44==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=804&bar=945');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200090)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4600
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4600
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(335));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton45'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton45==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=335&bar=202');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200092)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4700
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4700
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(180));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton46'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton46==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=180&bar=213');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200094)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4800
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4800
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(666));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton47'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton47==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=666&bar=333');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200096)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_4900
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_4900
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(339));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton48'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton48==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=339&bar=196');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200098)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_5000
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_5000
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(446));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton49'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton49==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=446&bar=212');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200100)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_5100
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_5100
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(9));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton50'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton50==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=9&bar=710');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
          expect(err.code).assertEqual(10200102)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Missing scheme');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_5200
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_5200
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(216));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton51'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton51==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=216&bar=829');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
          expect(err.code).assertEqual(10200104)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The # is reserved');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_5300
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_5300
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(952));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton52'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton52==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=952&bar=454');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
          expect(err.code).assertEqual(10200106)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #fragment is not allowed here');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_5400
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_5400
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(773));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton53'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton53==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=773&bar=707');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
          expect(err.code).assertEqual(10200108)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: The #It can't be the first');
      }
  })    
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_5500
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_5500
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(15));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton54'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton54==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=15&bar=370');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200110)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })
  })
}

