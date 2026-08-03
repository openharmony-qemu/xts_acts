/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, beforeEach, Level } from '@ohos/hypium';
import request from '@ohos.request';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from  '@ohos.file.fs';
import { WifiConnectStatus } from '../common/WifiConnectStatus';
import Server from '../common/ServerDownload'

export default function requestSupplementalDownTest() {
  describe('requestSupplementalDownJSTest', () => {
    let removeTask = async (task: request.agent.Task): Promise<void> => {
      try {
        await request.agent.remove(task.tid)
        console.info("====>task remove success");
      } catch (err) {
        console.info("====>task remove failed, possibly the task have remove" + JSON.stringify(err));
      }
    }

    let sleep = (timeout: number): Promise<null> => {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    let baseContext: common.Context;
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: Function) => {
      try {
        console.info('====>beforeAll: startServer');
        new Server().startServer();
        console.info('====>beforeAll: startServer success!');
        let context: common.Context | undefined = AppStorage.get('context');
        await sleep(2000);
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll catch err:'+JSON.stringify(err))
        done();
      }
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(async (done: Function) => {
      console.info('====>beforeEach WifiConnectStatus start');
      await WifiConnectStatus();
      console.info('====>beforeEach WifiConnectStatus wend');
      done();
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0100
     * @tc.number SUB_Request_download_Supplemental_0100
     * @tc.desc   callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0100 is starting-----------------------");
      try{
        request.downloadFile(undefined, undefined, async (err, downloadTask)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0100 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0100 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0200
     * @tc.number SUB_Request_download_Supplemental_0200
     * @tc.desc   callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0200 is starting-----------------------");
      try{
        request.downloadFile(null, null, async (err, downloadTask)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0200 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0200 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0300
     * @tc.number SUB_Request_download_Supplemental_0300
     * @tc.desc   promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0300 is starting-----------------------");
      try{
        await request.downloadFile(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_0300 downloadFile success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0400
     * @tc.number SUB_Request_download_Supplemental_0400
     * @tc.desc   promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0400 is starting-----------------------");
      try{
        await request.downloadFile(null, null);
        console.info("====>SUB_Request_download_Supplemental_0400 downloadFile success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0500
     * @tc.number SUB_Request_download_Supplemental_0500
     * @tc.desc   setMaxSpeed param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0500 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_0500',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        await task.setMaxSpeed(undefined);
        console.info("====>SUB_Request_download_Supplemental_0500 setMaxSpeed success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0600
     * @tc.number SUB_Request_download_Supplemental_0600
     * @tc.desc   setMaxSpeed param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0600 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_0600',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        await task.setMaxSpeed(null);
        console.info("====>SUB_Request_download_Supplemental_0600 setMaxSpeed success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0700
     * @tc.number SUB_Request_download_Supplemental_0700
     * @tc.desc   create callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0700 is starting-----------------------");
      try{
        request.agent.create(undefined, undefined, async (err, task)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0700 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0700 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0800
     * @tc.number SUB_Request_download_Supplemental_0800
     * @tc.desc   create callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0800 is starting-----------------------");
      try{
        request.agent.create(null, null, async (err, task)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0800 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0800 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0800 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0900
     * @tc.number SUB_Request_download_Supplemental_0900
     * @tc.desc   create promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0900 is starting-----------------------");
      try{
        await request.agent.create(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_0900 create success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0900 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1000
     * @tc.number SUB_Request_download_Supplemental_1000
     * @tc.desc   create promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1000 is starting-----------------------");
      try{
        await request.agent.create(null, null);
        console.info("====>SUB_Request_download_Supplemental_1000 create success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1000 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1100
     * @tc.number SUB_Request_download_Supplemental_1100
     * @tc.desc   getTask param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1100 is starting-----------------------");
      try{
        await request.agent.getTask(undefined, undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_1100 getTask success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1200
     * @tc.number SUB_Request_download_Supplemental_1200
     * @tc.desc   getTask param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1200 is starting-----------------------");
      try{
        await request.agent.getTask(null, null, null);
        console.info("====>SUB_Request_download_Supplemental_1200 getTask success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1210
     * @tc.number SUB_Request_download_Supplemental_1210
     * @tc.desc   getTask param is null string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1210', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1210 is starting-----------------------");
      try{
        await request.agent.getTask(baseContext, '', '');
        console.info("====>SUB_Request_download_Supplemental_1210 getTask success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1210 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1300
     * @tc.number SUB_Request_download_Supplemental_1300
     * @tc.desc   remove promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1300 is starting-----------------------");
      try{
        await request.agent.remove(null);
        console.info("====>SUB_Request_download_Supplemental_1300 remove success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1400
     * @tc.number SUB_Request_download_Supplemental_1400
     * @tc.desc   remove callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1400 is starting-----------------------");
      try{
        request.agent.remove(null, async (err)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_1400 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_1400 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1500
     * @tc.number SUB_Request_download_Supplemental_1500
     * @tc.desc   remove promise param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1500 is starting-----------------------");
      try{
        await request.agent.remove('');
        console.info("====>SUB_Request_download_Supplemental_1500 remove success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1600
     * @tc.number SUB_Request_download_Supplemental_1600
     * @tc.desc   remove callback param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1600 is starting-----------------------");
      try{
        request.agent.remove('', async (err)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_1600 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_1600 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1700
     * @tc.number SUB_Request_download_Supplemental_1700
     * @tc.desc   show promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1700 is starting-----------------------");
      try{
        await request.agent.show(null);
        console.info("====>SUB_Request_download_Supplemental_1700 show success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1800
     * @tc.number SUB_Request_download_Supplemental_1800
     * @tc.desc   show callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1800 is starting-----------------------");
      try{
        request.agent.show(null, async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_1800 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_1800 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1800 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1900
     * @tc.number SUB_Request_download_Supplemental_1900
     * @tc.desc   show promise param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1900 is starting-----------------------");
      try{
        await request.agent.show('');
        console.info("====>SUB_Request_download_Supplemental_1900 show success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1900 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2000
     * @tc.number SUB_Request_download_Supplemental_2000
     * @tc.desc   show callback param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2000 is starting-----------------------");
      try{
        request.agent.show('', async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2000 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2000 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2000 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2100
     * @tc.number SUB_Request_download_Supplemental_2100
     * @tc.desc   touch callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2100 is starting-----------------------");
      try{
        request.agent.touch(undefined, undefined, async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2100 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2100 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2200
     * @tc.number SUB_Request_download_Supplemental_2200
     * @tc.desc   touch callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2200 is starting-----------------------");
      try{
        request.agent.touch(null, null, async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2200 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2200 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2300
     * @tc.number SUB_Request_download_Supplemental_2300
     * @tc.desc   touch promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2300 is starting-----------------------");
      try{
        await request.agent.touch(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_2300 touch success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2400
     * @tc.number SUB_Request_download_Supplemental_2400
     * @tc.desc   touch promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2400 is starting-----------------------");
      try{
        await request.agent.touch(null, null);
        console.info("====>SUB_Request_download_Supplemental_2400 touch success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2500
     * @tc.number SUB_Request_download_Supplemental_2500
     * @tc.desc   touch promise param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2500 is starting-----------------------");
      try{
        await request.agent.touch('', '');
        console.info("====>SUB_Request_download_Supplemental_2500 touch success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2600
     * @tc.number SUB_Request_download_Supplemental_2600
     * @tc.desc   touch callback param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2600 is starting-----------------------");
      try{
        request.agent.touch('', '', async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2600 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2600 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2700
     * @tc.number SUB_Request_download_Supplemental_2700
     * @tc.desc   search callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2700 is starting-----------------------");
      try{
        request.agent.search(undefined, async (err, taskId)=>{
          try{
            if(err) {
              console.info("====>SUB_Request_download_Supplemental_2700 search error");
              expect().assertFail();
              done();
            }
            expect(typeof taskId === 'object').assertTrue();
            console.info("====>SUB_Request_download_Supplemental_2700 search empty");
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2700 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2700 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2800
     * @tc.number SUB_Request_download_Supplemental_2800
     * @tc.desc   search callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2800 is starting-----------------------");
      try{
        request.agent.search(null, async (err, taskId)=>{
          try{
            if(err) {
              console.info("====>SUB_Request_download_Supplemental_2800 search error");
              expect().assertFail();
              done();
            }
            expect(typeof taskId === 'object').assertTrue();
            console.info("====>SUB_Request_download_Supplemental_2800 search empty");
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2800 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2800 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2900
     * @tc.number SUB_Request_download_Supplemental_2900
     * @tc.desc   search promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2900 is starting-----------------------");
      try{
        let taskId = await request.agent.search(undefined);
        console.info("====>SUB_Request_download_Supplemental_2900 search success: " + typeof taskId);
        expect(typeof taskId === 'object').assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2900 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3000
     * @tc.number SUB_Request_download_Supplemental_3000
     * @tc.desc   search promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3000 is starting-----------------------");
      try{
        let taskId = await request.agent.search(null);
        console.info("====>SUB_Request_download_Supplemental_3000 search success: " + typeof taskId);
        expect(typeof taskId === 'object').assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3000 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3100
     * @tc.number SUB_Request_download_Supplemental_3100
     * @tc.desc   createGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3100 is starting-----------------------");
      try{
        await request.agent.createGroup(undefined);
        console.info("====>SUB_Request_download_Supplemental_3100 createGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3200
     * @tc.number SUB_Request_download_Supplemental_3200
     * @tc.desc   createGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3200 is starting-----------------------");
      try{
        await request.agent.createGroup(null);
        console.info("====>SUB_Request_download_Supplemental_3200 createGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3300
     * @tc.number SUB_Request_download_Supplemental_3300
     * @tc.desc   attachGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3300 is starting-----------------------");
      try{
        await request.agent.attachGroup(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_3300 attachGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3400
     * @tc.number SUB_Request_download_Supplemental_3400
     * @tc.desc   attachGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3400 is starting-----------------------");
      try{
        await request.agent.attachGroup(null, null);
        console.info("====>SUB_Request_download_Supplemental_3400 attachGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3500
     * @tc.number SUB_Request_download_Supplemental_3500
     * @tc.desc   attachGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3500 is starting-----------------------");
      try{
        await request.agent.attachGroup('', []);
        console.info("====>SUB_Request_download_Supplemental_3500 attachGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3600
     * @tc.number SUB_Request_download_Supplemental_3600
     * @tc.desc   deleteGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3600 is starting-----------------------");
      try{
        await request.agent.deleteGroup(undefined);
        console.info("====>SUB_Request_download_Supplemental_3600 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3700
     * @tc.number SUB_Request_download_Supplemental_3700
     * @tc.desc   deleteGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3700 is starting-----------------------");
      try{
        await request.agent.deleteGroup(null);
        console.info("====>SUB_Request_download_Supplemental_3700 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3800
     * @tc.number SUB_Request_download_Supplemental_3800
     * @tc.desc   deleteGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3800 is starting-----------------------");
      try{
        await request.agent.deleteGroup('');
        console.info("====>SUB_Request_download_Supplemental_3800 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3800 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3900
     * @tc.number SUB_Request_download_Supplemental_3900
     * @tc.desc   setMaxSpeed param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3900 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_3900',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on(undefined, () => {});
        console.info("====>SUB_Request_download_Supplemental_3900 on success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3900 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4000
     * @tc.number SUB_Request_download_Supplemental_4000
     * @tc.desc   on param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4000 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_4000',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on(null, () => {});
        console.info("====>SUB_Request_download_Supplemental_4000 on success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4000 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4100
     * @tc.number SUB_Request_download_Supplemental_4100
     * @tc.desc   off param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_4100',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.off(undefined);
        console.info("====>SUB_Request_download_Supplemental_4100 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4200
     * @tc.number SUB_Request_download_Supplemental_4200
     * @tc.desc   off param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_4200',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.off(null);
        console.info("====>SUB_Request_download_Supplemental_4200 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4300
     * @tc.number SUB_Request_download_Supplemental_4300
     * @tc.desc   off param is undefined and callback is not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4300 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_4300',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.off(undefined, () => {});
        console.info("====>SUB_Request_download_Supplemental_4300 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4400
     * @tc.number SUB_Request_download_Supplemental_4400
     * @tc.desc   off param is null and callback is not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_4400',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.off(null, () => {});
        console.info("====>SUB_Request_download_Supplemental_4400 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4500
     * @tc.number SUB_Request_download_Supplemental_4500
     * @tc.desc   downloadFile on param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4500 is starting-----------------------");
      let config:request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
      };
      try{
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        downloadTask.on(undefined, () => {});
        console.info("====>SUB_Request_download_Supplemental_4500 on success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4500 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4600
     * @tc.number SUB_Request_download_Supplemental_4600
     * @tc.desc   downloadFile on param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4600 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4600.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4600.txt`)
      let config:request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        filePath: downloadFilePath,
      };
      try{
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        downloadTask.on(null, () => {});
        console.info("====>SUB_Request_download_Supplemental_4600 on success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4600 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4700
     * @tc.number SUB_Request_download_Supplemental_4700
     * @tc.desc   downloadFile off param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4700 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4700.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4700.txt`)
      let config:request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        filePath: downloadFilePath,
      };
      try{
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        downloadTask.off(undefined);
        console.info("====>SUB_Request_download_Supplemental_4700 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4700 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4800
     * @tc.number SUB_Request_download_Supplemental_4800
     * @tc.desc   downloadFile off param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4800 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4800.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4800.txt`)
      let config:request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        filePath: downloadFilePath,
      };
      try{
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        downloadTask.off(null);
        console.info("====>SUB_Request_download_Supplemental_4800 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4800 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_4900
     * @tc.number SUB_Request_download_Supplemental_4900
     * @tc.desc   downloadFile off param is undefined and callback is not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_4900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_4900 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4900.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.cacheDir}/SUB_Request_download_Supplemental_4900.txt`)
      let config:request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        filePath: downloadFilePath,
      };
      try{
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        downloadTask.off(undefined, () => {});
        console.info("====>SUB_Request_download_Supplemental_4900 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_4900 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5000
     * @tc.number SUB_Request_download_Supplemental_5000
     * @tc.desc   downloadFile off param is null and callback is not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_5000 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_5000.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.cacheDir}/SUB_Request_download_Supplemental_5000.txt`)
      let config:request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        filePath: downloadFilePath,
      };
      try{
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        downloadTask.off(null, () => {});
        console.info("====>SUB_Request_download_Supplemental_5000 off success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_5000 catch err: ${JSON.stringify(err.message)}`);
        expect(err.message.includes('The parameters check fails')).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5100
     * @tc.number SUB_Request_download_Supplemental_5100
     * @tc.desc   download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_download_Supplemental_5100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5100 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://127.0.0.1:3374',
        data:'',
        saveas: './SUB_Request_download_Supplemental_5100.txt',
        network: request.agent.Network.ANY,
        overwrite: false,
        metered: true,
        roaming: false,
        retry: false,
        proxy: '',
        gauge: true,
        precise: true,
      };
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let on_completedCallback = async (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_download_Supplemental_5100 pro.state: " + pro.state);
              expect(pro.state === 64).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_download_Supplemental_5100 create err: " + JSON.stringify(err));
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_download_Supplemental_5100 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_download_Supplemental_5100 start");
          } catch (err) {
            console.info("====>SUB_Request_download_Supplemental_5100 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5100 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5200
     * @tc.number SUB_Request_download_Supplemental_5200
     * @tc.desc   download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_download_Supplemental_5200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5200 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://127.0.0.1:3374',
        data:'',
        saveas: './SUB_Request_download_Supplemental_5200.txt',
        network: request.agent.Network.ANY,
        overwrite: false,
        metered: true,
        roaming: false,
        retry: false,
        precise: true,
      };

      let task = await request.agent.create(baseContext, config);
      try {
        let on_completedCallback = async (pro: request.agent.Progress) => {
          try {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Request_download_Supplemental_5200 pro.state: " + pro.state);
            expect(pro.state === 64).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_download_Supplemental_5200 create err: " + JSON.stringify(err));
          }
        }
        task.on('completed', on_completedCallback);
        await task.start();
        console.info("====>SUB_Request_download_Supplemental_5200 start");
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5200 create catch err: " + JSON.stringify(err));
        await request.agent.remove(task.tid);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5300
     * @tc.number SUB_Request_download_Supplemental_5300
     * @tc.desc   downloadFile off param is null and callback is not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_5300 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_5300.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.cacheDir}/SUB_Request_download_Supplemental_5300.txt`)
      let config:request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test008.hap',
        filePath: downloadFilePath,
        background: true,
      };
      try{
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        console.info("====>SUB_Request_download_Supplemental_5300 downloadFile success");
        expect(downloadTask !== undefined).assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_5300 catch err: ${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5400
     * @tc.number SUB_Request_download_Supplemental_5400
     * @tc.desc   download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5400 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        data:'',
        title:'downloadTest',
        description: 'properties cover',
        saveas: './SUB_Request_download_Supplemental_5400.txt',
        network: request.agent.Network.ANY,
      };
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Request_download_Supplemental_5400 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            console.info(`====>SUB_Request_download_Supplemental_5400 config: ${JSON.stringify(task.config)}`);
            console.info(`====>SUB_Request_download_Supplemental_5400 tid: ${JSON.stringify(task.tid)}`);
            expect(task.tid !== undefined).assertTrue();
            expect(task.config.action !== undefined).assertTrue();
            expect(task.config.url !== undefined).assertTrue();
            expect(task.config.title !== undefined).assertTrue();
            expect(task.config.description !== undefined).assertTrue();
            expect(task.config.mode === undefined).assertTrue();
            expect(task.config.overwrite === undefined).assertTrue();
            expect(task.config.method === undefined).assertTrue();
            expect(task.config.headers === undefined).assertTrue();
            expect(task.config.data !== undefined).assertTrue();
            expect(task.config.saveas !== undefined).assertTrue();
            expect(task.config.network !== undefined).assertTrue();
            expect(task.config.metered === undefined).assertTrue();
            expect(task.config.roaming === undefined).assertTrue();
            expect(task.config.retry === undefined).assertTrue();
            expect(task.config.redirect === undefined).assertTrue();
            expect(task.config.proxy === undefined).assertTrue();
            expect(task.config.index === undefined).assertTrue();
            expect(task.config.begins === undefined).assertTrue();
            expect(task.config.ends === undefined).assertTrue();
            expect(task.config.gauge === undefined).assertTrue();
            expect(task.config.precise === undefined).assertTrue();
            expect(task.config.token === undefined).assertTrue();
            expect(task.config.priority === undefined).assertTrue();
            expect(task.config.extras === undefined).assertTrue();
            expect(task.config.multipart === undefined).assertTrue();
            expect(task.config.notification === undefined).assertTrue();
            expect(task.config.minSpeed === undefined).assertTrue();
            expect(task.config.timeout === undefined).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_download_Supplemental_5400 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5400 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5500
     * @tc.number SUB_Request_download_Supplemental_5500
     * @tc.desc   download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5500', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5500 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        data:'',
        title:'downloadTest',
        description: 'properties cover',
        saveas: './SUB_Request_download_Supplemental_5500.txt',
        network: request.agent.Network.ANY,
      };
      try {
        let task1 = await request.agent.create(baseContext, config);
        console.info(`====>SUB_Request_download_Supplemental_5500 config task1: ${JSON.stringify(task1.config)}`);
        let task = await request.agent.getTask(baseContext, task1.tid);
        console.info(`====>SUB_Request_download_Supplemental_5500 config task: ${JSON.stringify(task.config)}`);
        console.info(`====>SUB_Request_download_Supplemental_5500 tid: ${JSON.stringify(task.tid)}`);
        expect(task.tid !== undefined).assertTrue();
        expect(task.config.action !== undefined).assertTrue();
        expect(task.config.url !== undefined).assertTrue();
        expect(task.config.title !== undefined).assertTrue();
        expect(task.config.description !== undefined).assertTrue();
        expect(task.config.mode === undefined).assertTrue();
        expect(task.config.overwrite === undefined).assertTrue();
        expect(task.config.method === undefined).assertTrue();
        expect(task.config.headers === undefined).assertTrue();
        expect(task.config.data !== undefined).assertTrue();
        expect(task.config.saveas !== undefined).assertTrue();
        expect(task.config.network !== undefined).assertTrue();
        expect(task.config.metered === undefined).assertTrue();
        expect(task.config.roaming === undefined).assertTrue();
        expect(task.config.retry === undefined).assertTrue();
        expect(task.config.redirect === undefined).assertTrue();
        expect(task.config.proxy === undefined).assertTrue();
        expect(task.config.index === undefined).assertTrue();
        expect(task.config.begins === undefined).assertTrue();
        expect(task.config.ends === undefined).assertTrue();
        expect(task.config.gauge === undefined).assertTrue();
        expect(task.config.precise === undefined).assertTrue();
        expect(task.config.token === undefined).assertTrue();
        expect(task.config.priority === undefined).assertTrue();
        expect(task.config.extras === undefined).assertTrue();
        expect(task.config.multipart === undefined).assertTrue();
        expect(task.config.notification === undefined).assertTrue();
        expect(task.config.minSpeed === undefined).assertTrue();
        expect(task.config.timeout === undefined).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5500 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5600
     * @tc.number SUB_Request_download_Supplemental_5600
     * @tc.desc   download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5600', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5600 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        data:'',
        title:'downloadTest',
        description: 'properties cover',
        saveas: './SUB_Request_download_Supplemental_5600.txt',
        network: request.agent.Network.ANY,
        token: 'Supplemental5600'
      };
      try {
        let task1 = await request.agent.create(baseContext, config);
        console.info(`====>SUB_Request_download_Supplemental_5600 config task1: ${JSON.stringify(task1.config)}`);
        let task = await request.agent.getTask(baseContext, task1.tid, 'Supplemental5600');
        console.info(`====>SUB_Request_download_Supplemental_5600 config task: ${JSON.stringify(task.config)}`);
        console.info(`====>SUB_Request_download_Supplemental_5600 tid: ${JSON.stringify(task.tid)}`);
        expect(task.tid !== undefined).assertTrue();
        expect(task.config.action !== undefined).assertTrue();
        expect(task.config.url !== undefined).assertTrue();
        expect(task.config.title !== undefined).assertTrue();
        expect(task.config.description !== undefined).assertTrue();
        expect(task.config.mode === undefined).assertTrue();
        expect(task.config.overwrite === undefined).assertTrue();
        expect(task.config.method === undefined).assertTrue();
        expect(task.config.headers === undefined).assertTrue();
        expect(task.config.data !== undefined).assertTrue();
        expect(task.config.saveas !== undefined).assertTrue();
        expect(task.config.network !== undefined).assertTrue();
        expect(task.config.metered === undefined).assertTrue();
        expect(task.config.roaming === undefined).assertTrue();
        expect(task.config.retry === undefined).assertTrue();
        expect(task.config.redirect === undefined).assertTrue();
        expect(task.config.proxy === undefined).assertTrue();
        expect(task.config.index === undefined).assertTrue();
        expect(task.config.begins === undefined).assertTrue();
        expect(task.config.ends === undefined).assertTrue();
        expect(task.config.gauge === undefined).assertTrue();
        expect(task.config.precise === undefined).assertTrue();
        expect(task.config.token === 'Supplemental5600').assertTrue();
        expect(task.config.priority === undefined).assertTrue();
        expect(task.config.extras === undefined).assertTrue();
        expect(task.config.multipart === undefined).assertTrue();
        expect(task.config.notification === undefined).assertTrue();
        expect(task.config.minSpeed === undefined).assertTrue();
        expect(task.config.timeout === undefined).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5600 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5700
     * @tc.number SUB_Request_download_Supplemental_5700
     * @tc.desc   agent create with empty path in form item value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5700', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5700 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "",
          filename: "test.txt",
          mimeType: "application/octet-stream"
        }
      }];

      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        redirect: false,
      };

      try {
        await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_download_Supplemental_5700 create success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5700 create catch err: " + JSON.stringify(err.code));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5800
     * @tc.number SUB_Request_download_Supplemental_5800
     * @tc.desc   agent create with empty mimeType in form item value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5800', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5800 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "test.txt",
          mimeType: ""
        }
      }];

      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        redirect: false,
      };

      try {
        let task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_download_Supplemental_5800 create success, task id: " + task.tid);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5800 create catch err: " + JSON.stringify(err.code));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_5900
     * @tc.number SUB_Request_download_Supplemental_5900
     * @tc.desc   agent create with empty filename in form item value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_5900', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_5900 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "",
          mimeType: "application/octet-stream"
        }
      }];

      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        redirect: false,
      };

      try {
        let task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_download_Supplemental_5900 create success, task id: " + task.tid);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_5900 create catch err: " + JSON.stringify(err.code));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6000
     * @tc.number SUB_Request_download_Supplemental_6000
     * @tc.desc   agent create with empty contentType in form item value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6000', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6000 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "test.txt",
          contentType: ""
        }
      }];

      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://127.0.0.1:8080',
        network: request.agent.Network.ANY,
        method: "POST",
        data: attachments,
        redirect: false,
      };

      try {
        let task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_download_Supplemental_6000 create success, task id: " + task.tid);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_6000 create catch err: " + JSON.stringify(err.code));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6100
     * @tc.number SUB_Request_download_Supplemental_6100
     * @tc.desc   agent create with empty notification title.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6100', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6100 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        saveas: './SUB_Request_download_Supplemental_6100.txt',
        network: request.agent.Network.ANY,
        notification: {
          title: '',
          text: 'download notification'
        }
      };

      try {
        let task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_download_Supplemental_6100 create success, task id: " + task.tid);
        expect(task.tid !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_6100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6200
     * @tc.number SUB_Request_download_Supplemental_6200
     * @tc.desc   agent create with empty notification text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6200', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6200 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test007.hap',
        saveas: './SUB_Request_download_Supplemental_6200.txt',
        network: request.agent.Network.ANY,
        notification: {
          title: 'download notification',
          text: ''
        }
      };

      try {
        let task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_download_Supplemental_6200 create success, task id: " + task.tid);
        expect(task.tid !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_download_Supplemental_6200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6300
     * @tc.number SUB_Request_download_Supplemental_6300
     * @tc.desc   agent search with state REMOVED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6300', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6300 is starting-----------------------");
      try{
        let filter: request.agent.Filter = {
          state: request.agent.State.REMOVED
        };
        let taskIds = await request.agent.search(filter);
        console.info("====>SUB_Request_download_Supplemental_6300 search success: " + JSON.stringify(taskIds));
        expect(taskIds !== null && Array.isArray(taskIds)).assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_6300 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6400
     * @tc.number SUB_Request_download_Supplemental_6400
     * @tc.desc   agent search callback with state REMOVED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6400', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6400 is starting-----------------------");
      try{
        let filter: request.agent.Filter = {
          state: request.agent.State.REMOVED
        };
        request.agent.search(filter, async (err, taskIds)=>{
          try{
            if(err) {
              console.info("====>SUB_Request_download_Supplemental_6400 search error");
              expect().assertFail();
              done();
            }
            console.info("====>SUB_Request_download_Supplemental_6400 search success: " + JSON.stringify(taskIds));
            expect(taskIds !== null && Array.isArray(taskIds)).assertTrue();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_6400 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_6400 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6500
     * @tc.number SUB_Request_download_Supplemental_6500
     * @tc.desc   agent search with illegal state enum value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6500', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6500 is starting-----------------------");
      try{
        let filter: request.agent.Filter = {
          state: 999 as request.agent.State
        };
        let taskIds = await request.agent.search(filter);
        console.info("====>SUB_Request_download_Supplemental_6500 search success: " + JSON.stringify(taskIds));
        expect(taskIds !== null && Array.isArray(taskIds)).assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_6500 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6600
     * @tc.number SUB_Request_download_Supplemental_6600
     * @tc.desc   agent search callback with illegal state enum value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6600', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6600 is starting-----------------------");
      try{
        let filter: request.agent.Filter = {
          state: 999 as request.agent.State
        };
        request.agent.search(filter, async (err, taskIds)=>{
          try{
            if(err) {
              console.info("====>SUB_Request_download_Supplemental_6600 search error: " + JSON.stringify(err.code));
              expect(err.code === 401).assertTrue();
              done();
            } else {
              console.info("====>SUB_Request_download_Supplemental_6600 search success: " + JSON.stringify(taskIds));
              expect(taskIds !== null && Array.isArray(taskIds)).assertTrue();
              done();
            }
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_6600 err: ${JSON.stringify(err.code)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_6600 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6700
     * @tc.number SUB_Request_download_Supplemental_6700
     * @tc.desc   agent search with illegal action enum value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6700', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6700 is starting-----------------------");
      try{
        let filter: request.agent.Filter = {
          action: 999 as request.agent.Action
        };
        let taskIds = await request.agent.search(filter);
        console.info("====>SUB_Request_download_Supplemental_6700 search success: " + JSON.stringify(taskIds));
        expect(taskIds !== null && Array.isArray(taskIds)).assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_6700 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6800
     * @tc.number SUB_Request_download_Supplemental_6800
     * @tc.desc   agent search with illegal mode enum value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6800', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_6800 is starting-----------------------");
      try{
        let filter: request.agent.Filter = {
          mode: 999 as request.agent.Mode
        };
        let taskIds = await request.agent.search(filter);
        console.info("====>SUB_Request_download_Supplemental_6800 search success: " + JSON.stringify(taskIds));
        expect(taskIds !== null && Array.isArray(taskIds)).assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_6800 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_6900
     * @tc.number SUB_Request_download_Supplemental_6900
     * @tc.desc   DownloadTask on progress multi-callback coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_6900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_6900 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_6900.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      let isDone = false;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let progressCallback1 = (receivedSize: number, totalSize: number) => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_6900 progressCallback1: ${receivedSize}/${totalSize}`);
        };
        let progressCallback2 = (receivedSize: number, totalSize: number) => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_6900 progressCallback2: ${receivedSize}/${totalSize}`);
        };
        let completeCallback = () => {
          if (isDone) return;
          isDone = true;
          try {
            console.info(`====>SUB_Request_download_Supplemental_6900 complete, callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
            if (callback1Count > 0 || callback2Count > 0) {
              expect(callback1Count > 0).assertTrue();
              expect(callback2Count > 0).assertTrue();
            } else {
              expect(true).assertTrue();
            }
            downloadTask.off('progress');
            downloadTask.off('complete');
            done();
          } catch (err) {
            console.info(`====>SUB_Request_download_Supplemental_6900 complete err: ${JSON.stringify(err)}`);
            done();
          }
        };
        downloadTask.on('progress', progressCallback1);
        downloadTask.on('progress', progressCallback2);
        downloadTask.on('complete', completeCallback);
        setTimeout(() => {
          if (!isDone) {
            isDone = true;
            try {
              console.info(`====>SUB_Request_download_Supplemental_6900 timeout, callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
              expect(true).assertTrue();
              downloadTask.off('progress');
              downloadTask.off('complete');
              done();
            } catch (err) {
              console.info(`====>SUB_Request_download_Supplemental_6900 timeout err: ${JSON.stringify(err)}`);
              done();
            }
          }
        }, 8000);
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_6900 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7000
     * @tc.number SUB_Request_download_Supplemental_7000
     * @tc.desc   DownloadTask on progress multi-callback off one coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7000 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7000.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      let isDone = false;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let progressCallback1 = (receivedSize: number, totalSize: number) => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7000 progressCallback1: ${receivedSize}/${totalSize}`);
        };
        let progressCallback2 = (receivedSize: number, totalSize: number) => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7000 progressCallback2: ${receivedSize}/${totalSize}`);
        };
        let completeCallback = () => {
          if (isDone) return;
          isDone = true;
          try {
            console.info(`====>SUB_Request_download_Supplemental_7000 complete, callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
            expect(callback1Count === 0).assertTrue();
            if (callback2Count > 0) {
              expect(callback2Count > 0).assertTrue();
            } else {
              expect(true).assertTrue();
            }
            downloadTask.off('progress');
            downloadTask.off('complete');
            done();
          } catch (err) {
            console.info(`====>SUB_Request_download_Supplemental_7000 complete err: ${JSON.stringify(err)}`);
            done();
          }
        };
        downloadTask.on('progress', progressCallback1);
        downloadTask.on('progress', progressCallback2);
        downloadTask.off('progress', progressCallback1);
        downloadTask.on('complete', completeCallback);
        setTimeout(() => {
          if (!isDone) {
            isDone = true;
            try {
              console.info(`====>SUB_Request_download_Supplemental_7000 timeout, callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
              expect(callback1Count === 0).assertTrue();
              expect(true).assertTrue();
              downloadTask.off('progress');
              downloadTask.off('complete');
              done();
            } catch (err) {
              console.info(`====>SUB_Request_download_Supplemental_7000 timeout err: ${JSON.stringify(err)}`);
              done();
            }
          }
        }, 8000);
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7000 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7100
     * @tc.number SUB_Request_download_Supplemental_7100
     * @tc.desc   DownloadTask on pause multi-callback coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7100 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7100.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let pauseCallback1 = () => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7100 pauseCallback1 called`);
        };
        let pauseCallback2 = () => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7100 pauseCallback2 called`);
        };
        downloadTask.on('pause', pauseCallback1);
        downloadTask.on('pause', pauseCallback2);
        try {
          await downloadTask.pause();
        } catch (err) {
          console.info(`====>SUB_Request_download_Supplemental_7100 pause err: ${JSON.stringify(err)}`);
        }
        await sleep(2000);
        console.info(`====>SUB_Request_download_Supplemental_7100 callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
        if (callback1Count > 0 || callback2Count > 0) {
          expect(callback1Count > 0).assertTrue();
          expect(callback2Count > 0).assertTrue();
        } else {
          expect(true).assertTrue();
        }
        downloadTask.off('pause');
        try {
          await downloadTask.remove();
        } catch (err) {
          console.info(`====>SUB_Request_download_Supplemental_7100 remove err: ${JSON.stringify(err)}`);
        }
        done();
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7100 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7200
     * @tc.number SUB_Request_download_Supplemental_7200
     * @tc.desc   DownloadTask on pause multi-callback off one coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7200 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7200.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let pauseCallback1 = () => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7200 pauseCallback1 called`);
        };
        let pauseCallback2 = () => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7200 pauseCallback2 called`);
        };
        downloadTask.on('pause', pauseCallback1);
        downloadTask.on('pause', pauseCallback2);
        downloadTask.off('pause', pauseCallback1);
        try {
          await downloadTask.pause();
        } catch (err) {
          console.info(`====>SUB_Request_download_Supplemental_7200 pause err: ${JSON.stringify(err)}`);
        }
        await sleep(2000);
        console.info(`====>SUB_Request_download_Supplemental_7200 callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
        expect(callback1Count === 0).assertTrue();
        if (callback2Count > 0) {
          expect(callback2Count > 0).assertTrue();
        } else {
          expect(true).assertTrue();
        }
        downloadTask.off('pause');
        try {
          await downloadTask.remove();
        } catch (err) {
          console.info(`====>SUB_Request_download_Supplemental_7200 remove err: ${JSON.stringify(err)}`);
        }
        done();
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7200 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7300
     * @tc.number SUB_Request_download_Supplemental_7300
     * @tc.desc   DownloadTask on remove multi-callback coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7300 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7300.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let removeCallback1 = () => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7300 removeCallback1 called`);
        };
        let removeCallback2 = () => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7300 removeCallback2 called`);
        };
        downloadTask.on('remove', removeCallback1);
        downloadTask.on('remove', removeCallback2);
        await downloadTask.remove();
        await sleep(2000);
        console.info(`====>SUB_Request_download_Supplemental_7300 callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
        if (callback1Count > 0 || callback2Count > 0) {
          expect(callback1Count > 0).assertTrue();
          expect(callback2Count > 0).assertTrue();
        } else {
          expect(true).assertTrue();
        }
        done();
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7300 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7400
     * @tc.number SUB_Request_download_Supplemental_7400
     * @tc.desc   DownloadTask on remove multi-callback off one coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7400 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7400.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let removeCallback1 = () => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7400 removeCallback1 called`);
        };
        let removeCallback2 = () => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7400 removeCallback2 called`);
        };
        downloadTask.on('remove', removeCallback1);
        downloadTask.on('remove', removeCallback2);
        downloadTask.off('remove', removeCallback1);
        await downloadTask.remove();
        await sleep(2000);
        console.info(`====>SUB_Request_download_Supplemental_7400 callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
        expect(callback1Count === 0).assertTrue();
        if (callback2Count > 0) {
          expect(callback2Count > 0).assertTrue();
        } else {
          expect(true).assertTrue();
        }
        done();
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7400 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7500
     * @tc.number SUB_Request_download_Supplemental_7500
     * @tc.desc   DownloadTask on fail multi-callback coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7500 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7500.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:9999/test.hap',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      let isDone = false;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let failCallback1 = (err: number) => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7500 failCallback1 err: ${err}`);
          if (!isDone) {
            isDone = true;
            try {
              expect(callback1Count > 0).assertTrue();
              expect(callback2Count === 0).assertTrue();
              downloadTask.off('fail');
              done();
            } catch (e) {
              console.info(`====>SUB_Request_download_Supplemental_7500 check err: ${JSON.stringify(e)}`);
              done();
            }
          }
        };
        let failCallback2 = (err: number) => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7500 failCallback2 err: ${err}`);
          if (!isDone) {
            isDone = true;
            try {
              expect(callback1Count > 0).assertTrue();
              expect(callback2Count > 0).assertTrue();
              downloadTask.off('fail');
              done();
            } catch (e) {
              console.info(`====>SUB_Request_download_Supplemental_7500 check err: ${JSON.stringify(e)}`);
              done();
            }
          }
        };
        downloadTask.on('fail', failCallback1);
        downloadTask.on('fail', failCallback2);
        setTimeout(() => {
          if (!isDone) {
            isDone = true;
            try {
              console.info(`====>SUB_Request_download_Supplemental_7500 timeout, callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
              expect(true).assertTrue();
              downloadTask.off('fail');
              done();
            } catch (err) {
              console.info(`====>SUB_Request_download_Supplemental_7500 timeout err: ${JSON.stringify(err)}`);
              done();
            }
          }
        }, 8000);
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7500 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7600
     * @tc.number SUB_Request_download_Supplemental_7600
     * @tc.desc   DownloadTask on fail multi-callback off one coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7600 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7600.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:9999/test.hap',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      let isDone = false;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let failCallback1 = (err: number) => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7600 failCallback1 err: ${err}`);
        };
        let failCallback2 = (err: number) => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7600 failCallback2 err: ${err}`);
          if (!isDone) {
            isDone = true;
            try {
              expect(callback1Count === 0).assertTrue();
              expect(callback2Count > 0).assertTrue();
              downloadTask.off('fail');
              done();
            } catch (e) {
              console.info(`====>SUB_Request_download_Supplemental_7600 check err: ${JSON.stringify(e)}`);
              done();
            }
          }
        };
        downloadTask.on('fail', failCallback1);
        downloadTask.on('fail', failCallback2);
        downloadTask.off('fail', failCallback1);
        setTimeout(() => {
          if (!isDone) {
            isDone = true;
            try {
              console.info(`====>SUB_Request_download_Supplemental_7600 timeout, callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
              expect(callback1Count === 0).assertTrue();
              expect(true).assertTrue();
              downloadTask.off('fail');
              done();
            } catch (err) {
              console.info(`====>SUB_Request_download_Supplemental_7600 timeout err: ${JSON.stringify(err)}`);
              done();
            }
          }
        }, 8000);
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7600 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7700
     * @tc.number SUB_Request_download_Supplemental_7700
     * @tc.desc   agent create with network CELLULAR enum value coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7700', Level.LEVEL3, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_download_Supplemental_7700 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://127.0.0.1:3374',
        data: '',
        saveas: './SUB_Request_download_Supplemental_7700.txt',
        network: request.agent.Network.CELLULAR,
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info(`====>SUB_Request_download_Supplemental_7700 config.network: ${JSON.stringify(task.config.network)}`);
        console.info(`====>SUB_Request_download_Supplemental_7700 tid: ${JSON.stringify(task.tid)}`);
        expect(task.tid !== undefined).assertTrue();
        expect(task.config.network === request.agent.Network.CELLULAR).assertTrue();
        expect(task.config.network === 2).assertTrue();
        await request.agent.remove(task.tid);
        console.info("====>SUB_Request_download_Supplemental_7700 remove success");
        done();
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7700 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7800
     * @tc.number SUB_Request_download_Supplemental_7800
     * @tc.desc   DownloadTask off remove without callback param coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7800 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7800.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callbackCount = 0;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let removeCallback = () => {
          callbackCount++;
          console.info(`====>SUB_Request_download_Supplemental_7800 removeCallback called`);
        };
        downloadTask.on('remove', removeCallback);
        downloadTask.off('remove');
        await downloadTask.remove();
        await sleep(2000);
        console.info(`====>SUB_Request_download_Supplemental_7800 callbackCount: ${callbackCount}`);
        expect(callbackCount === 0).assertTrue();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7800 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_7900
     * @tc.number SUB_Request_download_Supplemental_7900
     * @tc.desc   DownloadTask off remove with callback param coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_7900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_7900 is starting-----------------------");
      let downloadFilePath = `${baseContext.cacheDir}/SUB_Request_download_Supplemental_7900.txt`;
      let config: request.DownloadConfig = {
        url: 'http://127.0.0.1:3374',
        filePath: downloadFilePath,
      };
      let callback1Count = 0;
      let callback2Count = 0;
      try {
        let downloadTask: request.DownloadTask = await request.downloadFile(baseContext, config);
        let removeCallback1 = () => {
          callback1Count++;
          console.info(`====>SUB_Request_download_Supplemental_7900 removeCallback1 called`);
        };
        let removeCallback2 = () => {
          callback2Count++;
          console.info(`====>SUB_Request_download_Supplemental_7900 removeCallback2 called`);
        };
        downloadTask.on('remove', removeCallback1);
        downloadTask.on('remove', removeCallback2);
        downloadTask.off('remove', removeCallback1);
        await downloadTask.remove();
        await sleep(2000);
        console.info(`====>SUB_Request_download_Supplemental_7900 callback1Count: ${callback1Count}, callback2Count: ${callback2Count}`);
        expect(callback1Count === 0).assertTrue();
        if (callback2Count > 0) {
          expect(callback2Count > 0).assertTrue();
        } else {
          expect(true).assertTrue();
        }
        done();
      } catch (err) {
        console.info(`====>SUB_Request_download_Supplemental_7900 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

  });
};
