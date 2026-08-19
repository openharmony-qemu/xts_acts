/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  LogClassDecorator, 
  ObservableClassDecorator,
  Entity, 
  EntityLegacyConfig,
  Column, 
  PrimaryKey,
  RangePropertyDecorator,
  LogMethodDecorator,
  ValidateMethodDecorator,
  MeasureMethodDecorator
} from './Decorators';
import { collections } from '@kit.ArkTS';
'use shared'

const cacheEntryConfig: EntityLegacyConfig = new EntityLegacyConfig('cache.entry');

@Sendable
@LogClassDecorator
export class SharedModuleDataSendable {
  public moduleId: string = '';
  public moduleName: string = '';
  public moduleVersion: string = '';
  public sharedData: collections.Array<string> = new collections.Array<string>();
  public sharedMap: collections.Map<string, number> = new collections.Map<string, number>();
  public logs: collections.Array<string> = new collections.Array<string>();
  
  constructor(moduleId: string, moduleName: string) {
    this.moduleId = moduleId;
    this.moduleName = moduleName;
    this.moduleVersion = '1.0.0';
  }
  
  @LogMethodDecorator
  addSharedData(data: string): void {
    this.sharedData.push(data);
    this.logs.push('addSharedData');
  }
  
  @LogMethodDecorator
  addSharedMapEntry(key: string, value: number): void {
    this.sharedMap.set(key, value);
    this.logs.push('addSharedMapEntry: ' + key);
  }
  
  @ValidateMethodDecorator
  validateModule(): boolean {
    return this.moduleId.length > 0 && this.moduleName.length > 0;
  }
  
  static createSharedModule(id: string, name: string): SharedModuleDataSendable {
    return new SharedModuleDataSendable(id, name);
  }
  
  static getSharedDataCount(module: SharedModuleDataSendable): number {
    return module.sharedData.length;
  }
}

@Sendable
@Entity(cacheEntryConfig)
@LogClassDecorator
@ObservableClassDecorator
export class SharedModuleEntitySendable {
  @PrimaryKey
  @Column('shared_entity_id')
  public sharedEntityId: string = '';
  
  @Column('entity_name')
  public entityName: string = '';
  
  @Column('entity_type')
  public entityType: string = '';
  
  @Column('is_shared')
  public isShared: boolean = true;
  
  @Column('shared_count')
  @RangePropertyDecorator(0, 1000)
  public sharedCount: number = 0;
  
  public sharedReferences: collections.Array<string> = new collections.Array<string>();
  public logs: collections.Array<string> = new collections.Array<string>();
  
  constructor(sharedEntityId: string, entityName: string, entityType: string) {
    this.sharedEntityId = sharedEntityId;
    this.entityName = entityName;
    this.entityType = entityType;
  }
  
  @LogMethodDecorator
  addReference(refId: string): void {
    this.sharedReferences.push(refId);
    this.sharedCount = this.sharedCount + 1;
    this.logs.push('addReference: ' + refId);
  }
  
  @LogMethodDecorator
  removeReference(refId: string): boolean {
    const index: number = this.sharedReferences.indexOf(refId);
    if (index >= 0) {
      this.sharedReferences.splice(index, 1);
      this.sharedCount = this.sharedCount - 1;
      this.logs.push('removeReference: ' + refId);
      return true;
    }
    return false;
  }
  
  @ValidateMethodDecorator
  validateSharedEntity(): boolean {
    return this.sharedEntityId.length > 0 && this.isShared;
  }
  
  @MeasureMethodDecorator
  @LogMethodDecorator
  async shareEntityAsync(): Promise<boolean> {
    this.logs.push('shareEntityAsync start');
    
    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });
    
    this.isShared = true;
    this.logs.push('shareEntityAsync success');
    return true;
  }
  
  @LogMethodDecorator
  async unshareEntityAsync(): Promise<boolean> {
    this.logs.push('unshareEntityAsync start');
    
    await new Promise<void>((resolve: Function) => {
      setTimeout(resolve, 100);
    });
    
    this.isShared = false;
    this.logs.push('unshareEntityAsync success');
    return true;
  }
  
  static createSharedEntity(id: string, name: string, type: string): SharedModuleEntitySendable {
    return new SharedModuleEntitySendable(id, name, type);
  }
}