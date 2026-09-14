/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

const NPM_BACKUP_URL_MAP: Record<string, string> = {
  '6.9.1': 'https://cdn.npmmirror.com/binaries/node/v6.9.1/node-v6.9.1.tar.gz',
  '6.10.2': 'https://cdn.npmmirror.com/binaries/node/v6.10.2/node-v6.10.2.tar.gz',
  '6.14.2': 'https://cdn.npmmirror.com/binaries/node/v6.14.2/node-v6.14.2.tar.gz',
  '6.14.16': 'https://httpbin.org/bytes/5968743',
};

export function getNpmPrimaryUrl(version: string): string {
  return `https://mirrors.huaweicloud.com/npm-software/v${version}.tar.gz`;
}

export function getNpmBackupUrl(version: string): string {
  if (NPM_BACKUP_URL_MAP[version] !== undefined) {
    return NPM_BACKUP_URL_MAP[version];
  }
  return `https://cdn.npmmirror.com/binaries/node/v${version}/node-v${version}.tar.gz`;
}

export function extractNpmVersionFromUrl(url: string): string {
  const match = url.match(/npm-software\/v([\d.]+)\.tar\.gz/);
  if (match && match[1]) {
    return match[1];
  }
  return '6.14.16';
}
