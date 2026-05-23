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

type FieldValue = string | number | boolean | undefined | null | FieldValue[] | Record<string, FieldValue> | ReflectClass;

const FIELD_VALUE_EQUALS_MAX_DEPTH: number = 20;

function fieldValueEquals(a: FieldValue, b: FieldValue, depth: number = 0): boolean {
  if (depth > FIELD_VALUE_EQUALS_MAX_DEPTH) {
    console.warn(`fieldValueEquals: max depth ${FIELD_VALUE_EQUALS_MAX_DEPTH} exceeded, treating as not equal`);
    return false;
  }
  if (typeof a === 'number' && typeof b === 'number' && a !== a && b !== b) {
    return true;
  }
  if (a === b) {
    return true;
  }
  if (a === null || b === null || a === undefined || b === undefined) {
    return false;
  }
  if (typeof a !== typeof b) {
    return false;
  }
  if (Array.isArray(a) && Array.isArray(b)) {
    let arrA: FieldValue[] = a as FieldValue[];
    let arrB: FieldValue[] = b as FieldValue[];
    if (arrA.length !== arrB.length) {
      return false;
    }
    for (let i = 0; i < arrA.length; i++) {
      let valA: FieldValue = arrA[i] as FieldValue;
      let valB: FieldValue = arrB[i] as FieldValue;
      if (!fieldValueEquals(valA, valB, depth + 1)) {
        return false;
      }
    }
    return true;
  }
  if (typeof a === 'object' && typeof b === 'object') {
    if (a instanceof ReflectClass && b instanceof ReflectClass) {
      return a.equals(b);
    }
    let keysA: string[] = Object.keys(a as Record<string, FieldValue>);
    let keysB: string[] = Object.keys(b as Record<string, FieldValue>);
    if (keysA.length !== keysB.length) {
      return false;
    }
    for (let key of keysA) {
      if (keysB.findIndex((k: string) => k === key) === -1) {
        return false;
      }
      if (!fieldValueEquals(
        (a as Record<string, FieldValue>)[key],
        (b as Record<string, FieldValue>)[key],
        depth + 1
      )) {
        return false;
      }
    }
    return true;
  }
  return false;
}

interface StaticField {
  getName(): string;

  getOwner(): ReflectClass;

  getType(): ReflectClass;

  getValue(): FieldValue;

  equals(other: StaticField | null | undefined): boolean;

  isPublic(): boolean;

  isPrivate(): boolean;

  isProtected(): boolean;

  isInternal(): boolean;

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
  private isInternalFlag: boolean;

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
    this.isInternalFlag = !isPublic && !isPrivate && !isProtected;
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
    if (other === undefined || other === null) {
      return false;
    }
    let otherField: StaticField = other as StaticField;
    let otherOwner: ReflectClass = otherField.getOwner();
    let otherType: ReflectClass = otherField.getType();
    let thisVal = this.value;
    let otherVal = otherField.getValue();
    if (typeof thisVal === 'number' && typeof otherVal === 'number') {
      let thisIsNaN: boolean = thisVal !== thisVal;
      let otherIsNaN: boolean = otherVal !== otherVal;
      if (thisIsNaN && otherIsNaN) {
        return this.name === otherField.getName() &&
        this.owner.equals(otherOwner) &&
        this.type.equals(otherType);
      }
      if (thisIsNaN !== otherIsNaN) {
        return false;
      }
    }
    return this.name === otherField.getName() &&
    this.owner.equals(otherOwner) &&
    this.type.equals(otherType) &&
    fieldValueEquals(thisVal, otherVal);
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

  isInternal(): boolean {
    return this.isInternalFlag;
  }

  isReadonly(): boolean {
    return this.isReadonlyFlag;
  }

  setValue(value: FieldValue): void {
    if (this.isReadonlyFlag) {
      throw new TypeError('Cannot set value on readonly field');
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
    if ((isPublic && isPrivate) || (isPublic && isProtected) || (isPrivate && isProtected)) {
      throw new TypeError(`StaticField '${name}': only one access modifier can be true.`);
    }
    if (!isPublic && !isPrivate && !isProtected) {
      throw new TypeError(`StaticField '${name}': at least one access modifier must be true. ` +
        `For internal fields, use addInternalStaticField instead.`);
    }

    let field = new StaticFieldImpl(name, this, type, value, isPublic, isPrivate, isProtected, isReadonly);
    this.staticFields.set(name, field);
  }

  addInternalStaticField(
    name: string,
    type: ReflectClass,
    value: FieldValue,
    isReadonly: boolean
  ): void {
    let field = new StaticFieldImpl(name, this, type, value, false, false, false, isReadonly);
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
    if ((isPublic && isPrivate) || (isPublic && isProtected) || (isPrivate && isProtected)) {
      throw new TypeError(`InstanceField '${name}': only one access modifier can be true.`);
    }
    if (!isPublic && !isPrivate && !isProtected) {
      throw new TypeError(`InstanceField '${name}': at least one access modifier must be true.`);
    }

    let field = new StaticFieldImpl(name, this, type, undefined, isPublic, isPrivate, isProtected, isReadonly);
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

const PLACEHOLDER_PASSWORD: string = 'placeholder_password';
const PLACEHOLDER_TOKEN: string = 'placeholder_token';
const PLACEHOLDER_API_KEY: string = 'placeholder_api_key';
const PLACEHOLDER_SSN: string = 'placeholder_ssn';
const PLACEHOLDER_CARD_NUMBER: string = 'placeholder_card_number';
const PLACEHOLDER_CVV: string = 'placeholder_cvv';
const PLACEHOLDER_USERNAME: string = 'placeholder_username';
const PLACEHOLDER_PATIENT_NAME: string = 'placeholder_patient';
const PLACEHOLDER_DIAGNOSIS: string = 'placeholder_diagnosis';

export { FieldValue, StaticField, StaticFieldImpl, ReflectClass, createReflectClass,
  PLACEHOLDER_PASSWORD, PLACEHOLDER_TOKEN, PLACEHOLDER_API_KEY, PLACEHOLDER_SSN,
  PLACEHOLDER_CARD_NUMBER, PLACEHOLDER_CVV, PLACEHOLDER_USERNAME, PLACEHOLDER_PATIENT_NAME,
  PLACEHOLDER_DIAGNOSIS };

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve: (value: int | PromiseLike<int>) => void, reject: (value: Error) => void) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
}
