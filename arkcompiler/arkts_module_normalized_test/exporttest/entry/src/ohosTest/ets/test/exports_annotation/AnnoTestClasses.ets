/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { AnnoStringDefault, AnnoNumberDefault, AnnoBooleanDefault, AnnoEnumArrayDefault } from './AnnoDefaults';
import { AnnoNoDefault, AnnoMultiField } from './AnnoNoDefault';
import { AnnoStatus } from './AnnoEnumSource';

@AnnoStringDefault
class AnnoTest0200Class {
  public tag: string = 'AnnoTest0200Class'
  public getTag(): string {
    return this.tag
  }
}

@AnnoNumberDefault
class AnnoTest0300Class {
  public tag: string = 'AnnoTest0300Class'
  public getTag(): string {
    return this.tag
  }
}

@AnnoBooleanDefault
class AnnoTest0400Class {
  public tag: string = 'AnnoTest0400Class'
  public getTag(): string {
    return this.tag
  }
}

@AnnoEnumArrayDefault
class AnnoTest0500Class {
  public tag: string = 'AnnoTest0500Class'
  public getTag(): string {
    return this.tag
  }
}

@AnnoNoDefault({ value: 'explicitValue' })
class AnnoTest0600Class {
  public tag: string = 'AnnoTest0600Class'
  public getTag(): string {
    return this.tag
  }
}

@AnnoMultiField
class AnnoTest0700Class {
  public tag: string = 'AnnoTest0700Class'
  public getTag(): string {
    return this.tag
  }
}

@AnnoMultiField({ name: 'customName', count: 20, enabled: true })
class AnnoTest0900Class {
  public tag: string = 'AnnoTest0900Class'
  public getTag(): string {
    return this.tag
  }
}

export { AnnoTest0200Class, AnnoTest0300Class, AnnoTest0400Class, AnnoTest0500Class, AnnoTest0600Class, AnnoTest0700Class, AnnoTest0900Class }
