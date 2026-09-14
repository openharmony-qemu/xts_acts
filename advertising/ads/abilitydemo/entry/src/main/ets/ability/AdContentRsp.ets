/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { RspBean } from './RspBean';


export class AdContentRsp extends RspBean {
  /**
   * 响应的错误码
   */
  public retcode?: number = -1;

  /**
   * 错误时的文本描述
   */
  public reason?: string = void 0;

  /**
   * 已经失效的素材id列表
   */
  public invalidcontentid?: string[] = void 0;

  /**
   * 已经失效的slogan id列表
   */
  public invalidSloganId?: string[] = void 0;

  /*
   * 因为fc超限，当天不再展示的素材id列表
   */
  public todayNoShowContentid?: string[] = void 0;


  /**
   * 服务器在广告响应中写入，后续的广告请求中客户端原样返回。例如服务器可以生成类似浏览器cookie用途的标识。在广告投放过程中可能会变化。
   * 跟广告类型无关
   */
  public ppsStore?: string = void 0;

  /**
   * 所有形式的广告本地缓存文件共同占用的空间大小，单位为MB，默认值为100MB
   */
  public totalCacheSize?: number = 800;

  /**
   * 广告定时预下载的时间间隔，单位为分钟.
   * 0：不定时预下载
   * 大于0的值：只要应用在前台，就以指定的时间间隔定时预下载
   */
  public adPreloadInterval?: number = 0;

  public clientAdRequestId?: string = void 0;


  /**
   * DSP消耗时延，单位毫秒
   */
  public dspcost?: number = 0;

  /**
   * 华为DSP消耗时延，单位毫秒
   */
  public dsp1cost?: number = 0;

  /**
   * 服务下发各组件时延，格式是：
   * AllServerCost,AllDspCost,AapCost,BapCost,IecCost,PoiCost,OnlyHwDsp,dsp1cost
   * 单位是毫秒
   */
  public cost?: string = void 0;

  public realAppPkgName?: string = void 0;

  public appLanguage?: string = void 0;

  public appCountry?: string = void 0;

  public filterResultMap?: Map<string, number> = void 0;

  public adFilterDuration?: number = void 0;

  /**
   * 广告请求类型
   */
  public requestType?: number = 1;

  public apiVer?: number = void 0;

  /***
   * SDK专用，用于传递服务端当前的版本
   */
  public trackVersion?: string = void 0;

  public testType?: string = void 0;

}