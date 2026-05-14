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

type FieldValue = string | number | boolean | null | undefined | Object | ReflectClass;

interface StaticField {
  getName(): string;

  getOwner(): ReflectClass;

  getType(): ReflectClass;

  getValue(): FieldValue;

  equals(other: StaticField | null | undefined): boolean;

  isPublic(): boolean;

  isPrivate(): boolean;

  isProtected(): boolean;

  isReadonly(): boolean;

  setValue(value: FieldValue): void;
}

class StaticFieldImpl implements StaticField {
  private name: string;
  private owner: ReflectClass;
  private type: ReflectClass;
  private value: FieldValue;
  private isPublicFlag: boolean;
  private isPrivateFlag: boolean;
  private isProtectedFlag: boolean;
  private isReadonlyFlag: boolean;

  constructor(
    name: string,
    owner: ReflectClass,
    type: ReflectClass,
    value: FieldValue,
    isPublic: boolean,
    isPrivate: boolean,
    isProtected: boolean,
    isReadonly: boolean
  ) {
    this.name = name;
    this.owner = owner;
    this.type = type;
    this.value = value;
    this.isPublicFlag = isPublic;
    this.isPrivateFlag = isPrivate;
    this.isProtectedFlag = isProtected;
    this.isReadonlyFlag = isReadonly;
  }

  getName(): string {
    return this.name;
  }

  getOwner(): ReflectClass {
    return this.owner;
  }

  getType(): ReflectClass {
    return this.type;
  }

  getValue(): FieldValue {
    return this.value;
  }

  equals(other: StaticField | null | undefined): boolean {
    if (other === null || other === undefined) {
      return false;
    }
    let otherField: StaticField = other as StaticField;
    let otherOwner: ReflectClass = otherField.getOwner();
    let otherType: ReflectClass = otherField.getType();
    return this.name === otherField.getName() &&
    this.owner.equals(otherOwner) &&
    this.type.equals(otherType);
  }

  isPublic(): boolean {
    return this.isPublicFlag;
  }

  isPrivate(): boolean {
    return this.isPrivateFlag;
  }

  isProtected(): boolean {
    return this.isProtectedFlag;
  }

  isReadonly(): boolean {
    return this.isReadonlyFlag;
  }

  setValue(value: FieldValue): void {
    if (this.isReadonlyFlag) {
      throw new Error('Cannot set value on readonly field');
    }
    this.value = value;
  }
}

class ReflectClass {
  private className: string;
  private staticFields: Map<string, StaticField>;
  private instanceFields: Map<string, StaticField>;

  constructor(className: string) {
    this.className = className;
    this.staticFields = new Map<string, StaticField>();
    this.instanceFields = new Map<string, StaticField>();
  }

  getName(): string {
    return this.className;
  }

  equals(other: ReflectClass): boolean {
    return this.className === other.getName();
  }

  addStaticField(
    name: string,
    type: ReflectClass,
    value: FieldValue,
    isPublic: boolean,
    isPrivate: boolean,
    isProtected: boolean,
    isReadonly: boolean
  ): void {
    let field = new StaticFieldImpl(name, this, type, value, isPublic, isPrivate, isProtected, isReadonly);
    this.staticFields.set(name, field);
  }

  addInstanceField(
    name: string,
    type: ReflectClass,
    isPublic: boolean,
    isPrivate: boolean,
    isProtected: boolean,
    isReadonly: boolean
  ): void {
    let field = new StaticFieldImpl(name, this, type, null, isPublic, isPrivate, isProtected, isReadonly);
    this.instanceFields.set(name, field);
  }

  getStaticField(name: string): StaticField | null {
    let field = this.staticFields.get(name);
    return field !== undefined ? field : null;
  }

  getDeclaredStaticFields(): StaticField[] {
    let result: StaticField[] = [];
    let values = this.staticFields.values();
    let it = values.next();
    while (!it.done) {
      let field: StaticField | undefined = it.value;
      if (field !== undefined) {
        result.push(field);
      }
      it = values.next();
    }
    return result;
  }

  getInstanceField(name: string): StaticField | null {
    let field = this.instanceFields.get(name);
    return field !== undefined ? field : null;
  }
}

function createReflectClass(className: string): ReflectClass {
  return new ReflectClass(className);
}

export { FieldValue, StaticField, StaticFieldImpl, ReflectClass, createReflectClass };