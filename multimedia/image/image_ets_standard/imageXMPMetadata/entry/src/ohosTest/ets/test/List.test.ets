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
import imageXMPMetadata from './ImageXMPMetadata.test';

import ExifCloneTest from './Metadata/ExifMetadata/Clone.test';
import ExifCreateInstanceTest from './Metadata/ExifMetadata/CreateInstance.test';
import ExifGetAllPropertiesTest from './Metadata/ExifMetadata/GetAllProperties.test';
import ExifGetBlobTest from './Metadata/ExifMetadata/GetBlob.test';
import ExifGetPropertiesTest from './Metadata/ExifMetadata/GetProperties.test';
import ExifSetBlobTest from './Metadata/ExifMetadata/SetBlob.test';
import ExifSetPropertiesTest from './Metadata/ExifMetadata/SetProperties.test';

import MakerNoteCloneTest from './Metadata/MakerNoteHuaweiMetadata/Clone.test';
import MakerNoteCreateInstanceTest from './Metadata/MakerNoteHuaweiMetadata/CreateInstance.test';
import MakerNoteGetAllPropertiesTest from './Metadata/MakerNoteHuaweiMetadata/GetAllProperties.test';
import MakerNoteGetBlobTest from './Metadata/MakerNoteHuaweiMetadata/GetBlob.test';
import MakerNoteGetPropertiesTest from './Metadata/MakerNoteHuaweiMetadata/GetProperties.test';
import MakerNoteSetBlobTest from './Metadata/MakerNoteHuaweiMetadata/SetBlob.test';
import MakerNoteSetPropertiesTest from './Metadata/MakerNoteHuaweiMetadata/SetProperties.test';

import CloneTest from './Metadata/Metadata/Clone.test';
import GetAllPropertiesTest from './Metadata/Metadata/GetAllProperties.test';
import GetBlobTest from './Metadata/Metadata/GetBlob.test';
import GetPropertiesTest from './Metadata/Metadata/GetProperties.test';
import SetBlobTest from './Metadata/Metadata/SetBlob.test';
import SetPropertiesTest from './Metadata/Metadata/SetProperties.test';

export default function testsuite() {
  imageXMPMetadata();

  ExifCloneTest();
  ExifCreateInstanceTest();
  ExifGetAllPropertiesTest();
  ExifGetBlobTest();
  ExifGetPropertiesTest();
  ExifSetBlobTest();
  ExifSetPropertiesTest();

  MakerNoteCloneTest();
  MakerNoteCreateInstanceTest();
  MakerNoteGetAllPropertiesTest();
  MakerNoteGetBlobTest();
  MakerNoteGetPropertiesTest();
  MakerNoteSetBlobTest();
  MakerNoteSetPropertiesTest();

  CloneTest();
  GetAllPropertiesTest();
  GetBlobTest();
  GetPropertiesTest();
  SetBlobTest();
  SetPropertiesTest();
}