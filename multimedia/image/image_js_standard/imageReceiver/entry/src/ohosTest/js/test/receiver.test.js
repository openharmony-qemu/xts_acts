/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";

export default function ImageReceiver() {
    describe("ImageReceiver", function () {
        let globalreceiver;
        let globalImg;
        const WIDTH = 8192;
        const HEIGHT = 8;
        const CAPACITY = 8;
        const RGBA = 12;
        const Jpg_Stride = 1;
        const DEVICE_CODE = 801;
        const { JPEG: FORMATJPEG } = image.ImageFormat;
        const { JPEG } = image.ComponentType;
        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(async function () {
            if (globalImg != undefined) {
                console.info("globalImg release start");
                try {
                    await globalImg.release();
                } catch (error) {
                    console.info("globalImg release fail");
                }
            }
            if (globalreceiver != undefined) {
                console.info("globalreceiver release start");
                try {
                    await globalreceiver.release();
                } catch (error) {
                    console.info("globalreceiver release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(async function () {
            console.info("afterAll case");
        });

        async function sleep(times = 200) {
            await new Promise((res) =>
                setTimeout(() => {
                    res();
                }, times)
            );
        }

        async function createRecriver(done, testNum, wid, hei, fmt, cap) {
            try {
                image.createImageReceiver(wid, hei, fmt, cap);
                expect(false).assertTrue();
                done();
                return;
            } catch (error) {
                expect(error.code == 401).assertTrue();
                console.info(`${testNum} err message` + error);
                done();
                return;
            }
        }

        function isString(value) {
            return typeof value === "string";
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_WITH_SIZE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_WITH_SIZE_0100
         * @tc.desc   1.set size,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_WITH_SIZE_0100", Level.LEVEL0, async function (done) {
            let size = {
                height: HEIGHT,
                width: WIDTH
            }
            var receiver = image.createImageReceiver(size, image.ImageFormat.JPEG, CAPACITY);
            expect(receiver != undefined).assertTrue();
            done();
            return;
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0100
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0100", Level.LEVEL0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                console.info("receiver_001 undefined");
                done();
                return;
            } else {
                globalreceiver = receiver;
                expect(receiver.size.width == WIDTH).assertTrue();
                expect(receiver.size.height == HEIGHT).assertTrue();
                expect(receiver.capacity == CAPACITY).assertTrue();
                expect(receiver.format == FORMATJPEG).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0200
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0200", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0200",
                WIDTH,
                HEIGHT,
                FORMATJPEG,
                "hd!"
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0100
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0100", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0100",
                WIDTH,
                HEIGHT,
                null,
                CAPACITY
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0200
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0200", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0200",
                WIDTH,
                null,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0300
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0300", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0300",
                null,
                HEIGHT,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0400
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0400", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0400",
                WIDTH,
                HEIGHT,
                FORMATJPEG,
                null
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0500
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0500", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0500",
                false,
                HEIGHT,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0600
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0600", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0600",
                { a: 10 },
                HEIGHT,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0300
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0300", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0300",
                WIDTH,
                false,
                FORMATJPEG,
                CAPACITY
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0700
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0700", Level.LEVEL0, async function (done) {
            createRecriver(
                done,
                "SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_ERROR_0700",
                WIDTH,
                HEIGHT,
                "form.",
                CAPACITY
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0400
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0400", Level.LEVEL0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_0400 undefined");
                done();
                return;
            } else {
                globalreceiver = receiver;
                expect(receiver.size.width == WIDTH).assertTrue();
                expect(receiver.size.height == HEIGHT).assertTrue();
                expect(receiver.capacity == CAPACITY).assertTrue();
                expect(receiver.format == FORMATJPEG).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100
         * @tc.desc   1.create ImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100", Level.LEVEL0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                globalreceiver = receiver;
                receiver
                    .getReceivingSurfaceId()
                    .then((id) => {
                        console.info(
                            "SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100 getReceivingSurfaceId [" +
                            id +
                            "]"
                        );
                        expect(isString(id)).assertTrue();
                        done();
                        return;
                    })
                    .catch((error) => {
                        console.log("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_0100 error: " + error);
                        expect(false).assertTrue();
                        done();
                        return;
                    });
            } else {
                expect(false).assertTrue();
                done();
                return;
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100
         * @tc.desc   1.create ImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100", Level.LEVEL0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                globalreceiver = receiver;
                receiver.getReceivingSurfaceId((err, id) => {
                    console.info(
                        "SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100 getReceivingSurfaceId call back [" +
                        id +
                        "]"
                    );
                    expect(isString(id)).assertTrue();
                    done();
                    return;
                });
            } else {
                expect(false).assertTrue();
                console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_0100
         * @tc.desc   1.create ImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_0100", Level.LEVEL0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                globalreceiver = receiver;
                receiver
                    .release()
                    .then(() => {
                        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_0100 release ");
                        done();
                        return;
                    })
                    .catch((error) => {
                        expect(false).assertTrue();
                        done();
                        return;
                    });
            } else {
                expect(false).assertTrue();
                console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_0100
         * @tc.desc   1.create ImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_0100", Level.LEVEL0, async function (done) {
            var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
            if (receiver != undefined) {
                globalreceiver = receiver;
                receiver.release((err) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_0100 release fail");
                        done();
                        return;
                    } else {
                        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_0100 release call back");
                        done();
                        return;
                    }
                });
            } else {
                expect(false).assertTrue();
                console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_0100 finished");
                done();
                return;
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_SUCCESS_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_SUCCESS_0100
         * @tc.desc   1.Create ImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_SUCCESS_0100", Level.LEVEL0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_SUCCESS_0100 start');
            let size = { height: HEIGHT, width: WIDTH }
            var receiver = image.createImageReceiver(size, image.ImageFormat.JPEG, CAPACITY);
            if (receiver == undefined) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_SUCCESS_0100 create image receiver failed');
                done();
                return;
            } else {
                globalreceiver = receiver;
                var error = receiver.checkDeviceTest;
                if (DEVICE_CODE == error) {
                    expect(error == DEVICE_CODE).assertTrue();
                    done();
                    return;
                }
                let ret = receiver.off("imageArrival");
                if (ret == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_SUCCESS_0100 off failed');
                    done();
                    return;
                } else {
                    console.info('SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_SUCCESS_0100 off success');
                    done();
                    return;
                }
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_ERROR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_ERROR_0200
         * @tc.desc   1.Create ImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_ERROR_0200", Level.LEVEL0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_ERROR_0200 start');
            let size = { height: HEIGHT, width: WIDTH }
            var receiver = image.createImageReceiver(size, image.ImageFormat.JPEG, CAPACITY);
            expect(receiver != undefined).assertTrue();
            if (receiver == undefined) {
                expect(false).assertTrue();
                done();
                return;
            } else {
                globalreceiver = receiver;
                var error = receiver.checkDeviceTest;
                if (DEVICE_CODE == error) {
                    expect(error == DEVICE_CODE).assertTrue();
                    done();
                    return;
                }
                try {
                    receiver.off('a');
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_ERROR_0200 off failed');
                    done();
                } catch (error) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_ERROR_0200 error: ' + JSON.stringify(error));
                    expect(error.code == 1).assertTrue();
                    done();
                }
            }
        });
    });
}
