import MediaTestBase from './MediaTestBase';
import media from '@ohos.multimedia.media'
import { setSource } from './AVPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

// #region - public params
const AUDIO_SOURCE = '01.mp3';
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
let fileDescriptor: media.AVFileDescriptor;
let avPlayer: media.AVPlayer | null = null;
let mediaTestBase = new MediaTestBase()
// #endregion

// #region - public function
function openFileFailed() {
    console.info('case file fail');
}

async function avPlayerCheckSupportPlaybackCommandByPromise(done: Function, command: media.PlaybackCommand, except_value: boolean) {
    avPlayer?.checkSupportPlaybackCommand(command).then((result: boolean) => {
        console.info('Succeeded in checking support playback command, result: ' + result);
        expect(result).assertEqual(except_value);
        done()
    }).catch((error: BusinessError) => {
        console.error(`Failed to check support playback command, error:${error}`);
        expect(except_value).assertEqual(false);
        done()
    });
}
// #endregion

export default function AVPlayerCheckSupportPlaybackCommand() {
    describe('AVPlayerCheckSupportPlaybackCommand', () => {
        // #region - node function
        beforeAll(async () => {
            console.info('beforeAll case');
            await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res) => {
                fileDescriptor = res;
            });
        })
        beforeEach(async () => {
            console.info('beforeEach case');
            await media.createAVPlayer().then((video) => {
                if (typeof (video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        })
        afterEach(async () => {
            console.info('afterEach case');
            if (avPlayer != null) {
                await avPlayer.release().then(() => {
                    avPlayer = null
                    console.log("avPlayer has been to null")
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
        })
        afterAll(async () => {
            console.info('afterAll case');
            await mediaTestBase.closeFdNumber(fileDescriptor.fd);
        })
        // #endregion

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0100
         * @tc.desc   query playback command SEEK in prepared state
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        if (!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayerCheckSupportPlaybackCommandByPromise(done, media.PlaybackCommand.PLAYBACK_COMMAND_SEEK, true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0200
         * @tc.desc   query playback command RATE in prepared state
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        if (!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayerCheckSupportPlaybackCommandByPromise(done, media.PlaybackCommand.PLAYBACK_COMMAND_RATE, true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0300
         * @tc.desc   query playback command SEEK in playing state
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        if (!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayerCheckSupportPlaybackCommandByPromise(done, media.PlaybackCommand.PLAYBACK_COMMAND_SEEK, true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0400
         * @tc.desc   query playback command RATE in playing state
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        if (!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayerCheckSupportPlaybackCommandByPromise(done, media.PlaybackCommand.PLAYBACK_COMMAND_RATE, true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0500
         * @tc.desc   query playback command SEEK in paused state
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        if (!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayer.pause()
                                break;
                            case PAUSED:
                                avPlayerCheckSupportPlaybackCommandByPromise(done, media.PlaybackCommand.PLAYBACK_COMMAND_SEEK, true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0600
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0600
         * @tc.desc   query playback command RATE in paused state
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        if (!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayer.pause()
                                break;
                            case PAUSED:
                                avPlayerCheckSupportPlaybackCommandByPromise(done, media.PlaybackCommand.PLAYBACK_COMMAND_RATE, true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0100
         * @tc.desc   query playback command SEEK without prepare, error code 5400102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0100', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        console.info('case current state is: ' + state)
                    });
                    avPlayer.checkSupportPlaybackCommand(media.PlaybackCommand.PLAYBACK_COMMAND_SEEK).then((result: boolean) => {
                        console.info('Succeeded in checking support playback command, result: ' + result);
                        expect().assertFail()
                        done()
                    }).catch((error: BusinessError) => {
                        console.error(`Failed to check support playback command, error:${error}`);
                        expect(error.code).assertEqual(5400102)
                        done()
                    });
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0200
         * @tc.desc   query playback command RATE without prepare, error code 5400102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0200', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        console.info('case current state is: ' + state)
                    });
                    avPlayer.checkSupportPlaybackCommand(media.PlaybackCommand.PLAYBACK_COMMAND_RATE).then((result: boolean) => {
                        console.info('Succeeded in checking support playback command, result: ' + result);
                        expect().assertFail()
                        done()
                    }).catch((error: BusinessError) => {
                        console.error(`Failed to check support playback command, error:${error}`);
                        expect(error.code).assertEqual(5400102)
                        done()
                    });
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0300
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0300
         * @tc.desc   query playback command SEEK without prepare, error code 5400102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_ERROR_0300', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        console.info('case current state is: ' + state)
                    });
                    avPlayer.checkSupportPlaybackCommand(media.PlaybackCommand.PLAYBACK_COMMAND_SEEK).then((result: boolean) => {
                        console.info('Succeeded in checking support playback command, result: ' + result);
                        expect().assertFail()
                        done()
                    }).catch((error: BusinessError) => {
                        console.error(`Failed to check support playback command, error:${error}`);
                        expect(error.code).assertEqual(5400102)
                        done()
                    });
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_RETURN_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_RETURN_0100
         * @tc.desc   check MD_KEY_TRACK_PLAYABLE in track description
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_CHECKSUPPORT_RETURN_0100', Level.LEVEL0, async (done: Function) => {
            if (!avPlayer) {
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            } else {
                try {
                    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
                        if (!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
                                    console.info('Succeeded in getting TrackDescription');
                                    if (arrList.length) {
                                        expect(media.MediaDescriptionKey.MD_KEY_TRACK_PLAYABLE).assertEqual('is_playable');
                                        for (let i = 0; i < arrList.length; i++) {
                                            let playableValue: Object = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_PLAYABLE];
                                            console.info('case track playable value is: ' + playableValue);
                                            expect(playableValue != undefined).assertEqual(true);
                                        }
                                    } else {
                                        expect().assertFail()
                                    }
                                    done()
                                }).catch((error: BusinessError) => {
                                    console.error(`Failed to get TrackDescription, error:${error}`);
                                    expect().assertFail()
                                    done()
                                });
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }

        })
    })
}
