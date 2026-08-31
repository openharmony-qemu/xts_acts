import image from "@ohos.multimedia.image";
import hilog from '@ohos.hilog';

interface ModifyRule {
    key: string;
    expectValue: string | undefined | null;
}

const allPropertyKeys = [image.PropertyKey.NEW_SUBFILE_TYPE
,image.PropertyKey.SUBFILE_TYPE
,image.PropertyKey.IMAGE_WIDTH
,image.PropertyKey.IMAGE_LENGTH
,image.PropertyKey.BITS_PER_SAMPLE
,image.PropertyKey.COMPRESSION
,image.PropertyKey.PHOTOMETRIC_INTERPRETATION
,image.PropertyKey.IMAGE_DESCRIPTION
,image.PropertyKey.STRIP_OFFSETS
,image.PropertyKey.ORIENTATION
,image.PropertyKey.SAMPLES_PER_PIXEL
,image.PropertyKey.ROWS_PER_STRIP
,image.PropertyKey.STRIP_BYTE_COUNTS
,image.PropertyKey.X_RESOLUTION
,image.PropertyKey.Y_RESOLUTION
,image.PropertyKey.PLANAR_CONFIGURATION
,image.PropertyKey.RESOLUTION_UNIT
,image.PropertyKey.TRANSFER_FUNCTION
,image.PropertyKey.SOFTWARE
,image.PropertyKey.DATE_TIME
,image.PropertyKey.ARTIST
,image.PropertyKey.WHITE_POINT
,image.PropertyKey.PRIMARY_CHROMATICITIES
,image.PropertyKey.PHOTO_MODE
,image.PropertyKey.JPEG_INTERCHANGE_FORMAT
,image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH
,image.PropertyKey.YCBCR_COEFFICIENTS
,image.PropertyKey.YCBCR_SUB_SAMPLING
,image.PropertyKey.YCBCR_POSITIONING
,image.PropertyKey.REFERENCE_BLACK_WHITE
,image.PropertyKey.COPYRIGHT
,image.PropertyKey.EXPOSURE_TIME
,image.PropertyKey.F_NUMBER
,image.PropertyKey.EXPOSURE_PROGRAM
,image.PropertyKey.SPECTRAL_SENSITIVITY
,image.PropertyKey.GPS_VERSION_ID
,image.PropertyKey.GPS_LATITUDE_REF
,image.PropertyKey.GPS_LATITUDE
,image.PropertyKey.GPS_LONGITUDE_REF
,image.PropertyKey.GPS_LONGITUDE
,image.PropertyKey.GPS_ALTITUDE_REF
,image.PropertyKey.GPS_ALTITUDE
,image.PropertyKey.GPS_TIME_STAMP
,image.PropertyKey.GPS_SATELLITES
,image.PropertyKey.GPS_STATUS
,image.PropertyKey.GPS_MEASURE_MODE
,image.PropertyKey.GPS_DOP
,image.PropertyKey.GPS_SPEED_REF
,image.PropertyKey.GPS_SPEED
,image.PropertyKey.GPS_TRACK_REF
,image.PropertyKey.GPS_TRACK
,image.PropertyKey.GPS_IMG_DIRECTION_REF
,image.PropertyKey.GPS_IMG_DIRECTION
,image.PropertyKey.GPS_MAP_DATUM
,image.PropertyKey.GPS_DEST_LATITUDE_REF
,image.PropertyKey.GPS_DEST_LATITUDE
,image.PropertyKey.GPS_DEST_LONGITUDE_REF
,image.PropertyKey.GPS_DEST_LONGITUDE
,image.PropertyKey.GPS_DEST_BEARING_REF
,image.PropertyKey.GPS_DEST_BEARING
,image.PropertyKey.GPS_DEST_DISTANCE_REF
,image.PropertyKey.GPS_DEST_DISTANCE
,image.PropertyKey.GPS_PROCESSING_METHOD
,image.PropertyKey.GPS_AREA_INFORMATION
,image.PropertyKey.GPS_DATE_STAMP
,image.PropertyKey.GPS_DIFFERENTIAL
,image.PropertyKey.GPS_H_POSITIONING_ERROR
,image.PropertyKey.ISO_SPEED_RATINGS
,image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
,image.PropertyKey.OECF
,image.PropertyKey.SENSITIVITY_TYPE
,image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY
,image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX
,image.PropertyKey.ISO_SPEED
,image.PropertyKey.ISO_SPEED_LATITUDE_YYY
,image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ
,image.PropertyKey.EXIF_VERSION
,image.PropertyKey.DATE_TIME_ORIGINAL
,image.PropertyKey.DATE_TIME_DIGITIZED
,image.PropertyKey.OFFSET_TIME
,image.PropertyKey.OFFSET_TIME_ORIGINAL
,image.PropertyKey.OFFSET_TIME_DIGITIZED
,image.PropertyKey.COMPONENTS_CONFIGURATION
,image.PropertyKey.COMPRESSED_BITS_PER_PIXEL
,image.PropertyKey.SHUTTER_SPEED
,image.PropertyKey.APERTURE_VALUE
,image.PropertyKey.BRIGHTNESS_VALUE
,image.PropertyKey.EXPOSURE_BIAS_VALUE
,image.PropertyKey.MAX_APERTURE_VALUE
,image.PropertyKey.SUBJECT_DISTANCE
,image.PropertyKey.METERING_MODE
,image.PropertyKey.LIGHT_SOURCE
,image.PropertyKey.FLASH
,image.PropertyKey.FOCAL_LENGTH
,image.PropertyKey.SUBJECT_AREA
,image.PropertyKey.MAKER_NOTE
,image.PropertyKey.USER_COMMENT
,image.PropertyKey.SUBSEC_TIME
,image.PropertyKey.SUBSEC_TIME_ORIGINAL
,image.PropertyKey.SUBSEC_TIME_DIGITIZED
,image.PropertyKey.FLASHPIX_VERSION
,image.PropertyKey.COLOR_SPACE
,image.PropertyKey.PIXEL_X_DIMENSION
,image.PropertyKey.PIXEL_Y_DIMENSION
,image.PropertyKey.RELATED_SOUND_FILE
,image.PropertyKey.FLASH_ENERGY
,image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE
,image.PropertyKey.FOCAL_PLANE_X_RESOLUTION
,image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION
,image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT
,image.PropertyKey.SUBJECT_LOCATION
,image.PropertyKey.EXPOSURE_INDEX
,image.PropertyKey.SENSING_METHOD
,image.PropertyKey.FILE_SOURCE
,image.PropertyKey.SCENE_TYPE
,image.PropertyKey.CFA_PATTERN
,image.PropertyKey.CUSTOM_RENDERED
,image.PropertyKey.EXPOSURE_MODE
,image.PropertyKey.WHITE_BALANCE
,image.PropertyKey.DIGITAL_ZOOM_RATIO
,image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM
,image.PropertyKey.SCENE_CAPTURE_TYPE
,image.PropertyKey.GAIN_CONTROL
,image.PropertyKey.CONTRAST
,image.PropertyKey.SATURATION
,image.PropertyKey.SHARPNESS
,image.PropertyKey.DEVICE_SETTING_DESCRIPTION
,image.PropertyKey.SUBJECT_DISTANCE_RANGE
,image.PropertyKey.IMAGE_UNIQUE_ID
,image.PropertyKey.CAMERA_OWNER_NAME
,image.PropertyKey.BODY_SERIAL_NUMBER
,image.PropertyKey.LENS_SPECIFICATION
,image.PropertyKey.LENS_MAKE
,image.PropertyKey.LENS_MODEL
,image.PropertyKey.LENS_SERIAL_NUMBER
,image.PropertyKey.COMPOSITE_IMAGE
,image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
,image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
,image.PropertyKey.GAMMA
,image.PropertyKey.DNG_VERSION
,image.PropertyKey.DEFAULT_CROP_SIZE
,image.PropertyKey.GIF_LOOP_COUNT
,image.PropertyKey.IS_XMAGE_SUPPORTED
,image.PropertyKey.XMAGE_MODE
,image.PropertyKey.XMAGE_LEFT
,image.PropertyKey.XMAGE_TOP
,image.PropertyKey.XMAGE_RIGHT
,image.PropertyKey.XMAGE_BOTTOM
,image.PropertyKey.CLOUD_ENHANCEMENT_MODE
,image.PropertyKey.WIND_SNAPSHOT_MODE
,image.PropertyKey.SCENE_VERSION
,image.PropertyKey.SCENE_FOOD_CONF
,image.PropertyKey.SCENE_STAGE_CONF
,image.PropertyKey.SCENE_BLUE_SKY_CONF
,image.PropertyKey.SCENE_GREEN_PLANT_CONF
,image.PropertyKey.SCENE_BEACH_CONF
,image.PropertyKey.SCENE_SNOW_CONF
,image.PropertyKey.SCENE_SUNSET_CONF
,image.PropertyKey.SCENE_FLOWERS_CONF
,image.PropertyKey.SCENE_NIGHT_CONF
,image.PropertyKey.SCENE_TEXT_CONF
,image.PropertyKey.FACE_COUNT
,image.PropertyKey.FACE_CONF
,image.PropertyKey.FACE_SMILE_SCORE
,image.PropertyKey.CAPTURE_MODE
,image.PropertyKey.BURST_NUMBER
,image.PropertyKey.FRONT_CAMERA
,image.PropertyKey.ROLL_ANGLE
,image.PropertyKey.PITCH_ANGLE
,image.PropertyKey.PHYSICAL_APERTURE
,image.PropertyKey.FOCUS_MODE
]

// ,image.PropertyKey.SCENE_POINTER
// ,image.PropertyKey.FACE_POINTER
// ,image.PropertyKey.FACE_VERSION
// ,image.PropertyKey.FACE_RECT
// ,image.PropertyKey.FACE_LEYE_CENTER
// ,image.PropertyKey.FACE_REYE_CENTER
// ,image.PropertyKey.FACE_MOUTH_CENTER

const exifKeys = [image.PropertyKey.NEW_SUBFILE_TYPE
,image.PropertyKey.SUBFILE_TYPE
,image.PropertyKey.IMAGE_WIDTH
,image.PropertyKey.IMAGE_LENGTH
,image.PropertyKey.BITS_PER_SAMPLE
,image.PropertyKey.COMPRESSION
,image.PropertyKey.PHOTOMETRIC_INTERPRETATION
,image.PropertyKey.IMAGE_DESCRIPTION
,image.PropertyKey.STRIP_OFFSETS
,image.PropertyKey.ORIENTATION
,image.PropertyKey.SAMPLES_PER_PIXEL
,image.PropertyKey.ROWS_PER_STRIP
,image.PropertyKey.STRIP_BYTE_COUNTS
,image.PropertyKey.X_RESOLUTION
,image.PropertyKey.Y_RESOLUTION
,image.PropertyKey.PLANAR_CONFIGURATION
,image.PropertyKey.RESOLUTION_UNIT
,image.PropertyKey.TRANSFER_FUNCTION
,image.PropertyKey.SOFTWARE
,image.PropertyKey.DATE_TIME
,image.PropertyKey.ARTIST
,image.PropertyKey.WHITE_POINT
,image.PropertyKey.PRIMARY_CHROMATICITIES
,image.PropertyKey.PHOTO_MODE
,image.PropertyKey.JPEG_INTERCHANGE_FORMAT
,image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH
,image.PropertyKey.YCBCR_COEFFICIENTS
,image.PropertyKey.YCBCR_SUB_SAMPLING
,image.PropertyKey.YCBCR_POSITIONING
,image.PropertyKey.REFERENCE_BLACK_WHITE
,image.PropertyKey.COPYRIGHT
,image.PropertyKey.EXPOSURE_TIME
,image.PropertyKey.F_NUMBER
,image.PropertyKey.EXPOSURE_PROGRAM
,image.PropertyKey.SPECTRAL_SENSITIVITY
,image.PropertyKey.GPS_VERSION_ID
,image.PropertyKey.GPS_LATITUDE_REF
,image.PropertyKey.GPS_LATITUDE
,image.PropertyKey.GPS_LONGITUDE_REF
,image.PropertyKey.GPS_LONGITUDE
,image.PropertyKey.GPS_ALTITUDE_REF
,image.PropertyKey.GPS_ALTITUDE
,image.PropertyKey.GPS_TIME_STAMP
,image.PropertyKey.GPS_SATELLITES
,image.PropertyKey.GPS_STATUS
,image.PropertyKey.GPS_MEASURE_MODE
,image.PropertyKey.GPS_DOP
,image.PropertyKey.GPS_SPEED_REF
,image.PropertyKey.GPS_SPEED
,image.PropertyKey.GPS_TRACK_REF
,image.PropertyKey.GPS_TRACK
,image.PropertyKey.GPS_IMG_DIRECTION_REF
,image.PropertyKey.GPS_IMG_DIRECTION
,image.PropertyKey.GPS_MAP_DATUM
,image.PropertyKey.GPS_DEST_LATITUDE_REF
,image.PropertyKey.GPS_DEST_LATITUDE
,image.PropertyKey.GPS_DEST_LONGITUDE_REF
,image.PropertyKey.GPS_DEST_LONGITUDE
,image.PropertyKey.GPS_DEST_BEARING_REF
,image.PropertyKey.GPS_DEST_BEARING
,image.PropertyKey.GPS_DEST_DISTANCE_REF
,image.PropertyKey.GPS_DEST_DISTANCE
,image.PropertyKey.GPS_PROCESSING_METHOD
,image.PropertyKey.GPS_AREA_INFORMATION
,image.PropertyKey.GPS_DATE_STAMP
,image.PropertyKey.GPS_DIFFERENTIAL
,image.PropertyKey.GPS_H_POSITIONING_ERROR
,image.PropertyKey.ISO_SPEED_RATINGS
,image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY
,image.PropertyKey.OECF
,image.PropertyKey.SENSITIVITY_TYPE
,image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY
,image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX
,image.PropertyKey.ISO_SPEED
,image.PropertyKey.ISO_SPEED_LATITUDE_YYY
,image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ
,image.PropertyKey.EXIF_VERSION
,image.PropertyKey.DATE_TIME_ORIGINAL
,image.PropertyKey.DATE_TIME_DIGITIZED
,image.PropertyKey.OFFSET_TIME
,image.PropertyKey.OFFSET_TIME_ORIGINAL
,image.PropertyKey.OFFSET_TIME_DIGITIZED
,image.PropertyKey.COMPONENTS_CONFIGURATION
,image.PropertyKey.COMPRESSED_BITS_PER_PIXEL
,image.PropertyKey.SHUTTER_SPEED
,image.PropertyKey.APERTURE_VALUE
,image.PropertyKey.BRIGHTNESS_VALUE
,image.PropertyKey.EXPOSURE_BIAS_VALUE
,image.PropertyKey.MAX_APERTURE_VALUE
,image.PropertyKey.SUBJECT_DISTANCE
,image.PropertyKey.METERING_MODE
,image.PropertyKey.LIGHT_SOURCE
,image.PropertyKey.FLASH
,image.PropertyKey.FOCAL_LENGTH
,image.PropertyKey.SUBJECT_AREA
,image.PropertyKey.MAKER_NOTE
,image.PropertyKey.USER_COMMENT
,image.PropertyKey.SUBSEC_TIME
,image.PropertyKey.SUBSEC_TIME_ORIGINAL
,image.PropertyKey.SUBSEC_TIME_DIGITIZED
,image.PropertyKey.FLASHPIX_VERSION
,image.PropertyKey.COLOR_SPACE
,image.PropertyKey.PIXEL_X_DIMENSION
,image.PropertyKey.PIXEL_Y_DIMENSION
,image.PropertyKey.RELATED_SOUND_FILE
,image.PropertyKey.FLASH_ENERGY
,image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE
,image.PropertyKey.FOCAL_PLANE_X_RESOLUTION
,image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION
,image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT
,image.PropertyKey.SUBJECT_LOCATION
,image.PropertyKey.EXPOSURE_INDEX
,image.PropertyKey.SENSING_METHOD
,image.PropertyKey.FILE_SOURCE
,image.PropertyKey.SCENE_TYPE
,image.PropertyKey.CFA_PATTERN
,image.PropertyKey.CUSTOM_RENDERED
,image.PropertyKey.EXPOSURE_MODE
,image.PropertyKey.WHITE_BALANCE
,image.PropertyKey.DIGITAL_ZOOM_RATIO
,image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM
,image.PropertyKey.SCENE_CAPTURE_TYPE
,image.PropertyKey.GAIN_CONTROL
,image.PropertyKey.CONTRAST
,image.PropertyKey.SATURATION
,image.PropertyKey.SHARPNESS
,image.PropertyKey.DEVICE_SETTING_DESCRIPTION
,image.PropertyKey.SUBJECT_DISTANCE_RANGE
,image.PropertyKey.IMAGE_UNIQUE_ID
,image.PropertyKey.CAMERA_OWNER_NAME
,image.PropertyKey.BODY_SERIAL_NUMBER
,image.PropertyKey.LENS_SPECIFICATION
,image.PropertyKey.LENS_MAKE
,image.PropertyKey.LENS_MODEL
,image.PropertyKey.LENS_SERIAL_NUMBER
,image.PropertyKey.COMPOSITE_IMAGE
,image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
,image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
,image.PropertyKey.GAMMA
,image.PropertyKey.DNG_VERSION
,image.PropertyKey.DEFAULT_CROP_SIZE
,image.PropertyKey.GIF_LOOP_COUNT
]


const makerNoteKeys = [image.PropertyKey.IS_XMAGE_SUPPORTED
,image.PropertyKey.XMAGE_MODE
,image.PropertyKey.XMAGE_LEFT
,image.PropertyKey.XMAGE_TOP
,image.PropertyKey.XMAGE_RIGHT
,image.PropertyKey.XMAGE_BOTTOM
,image.PropertyKey.CLOUD_ENHANCEMENT_MODE
,image.PropertyKey.WIND_SNAPSHOT_MODE
,image.PropertyKey.SCENE_VERSION
,image.PropertyKey.SCENE_FOOD_CONF
,image.PropertyKey.SCENE_STAGE_CONF
,image.PropertyKey.SCENE_BLUE_SKY_CONF
,image.PropertyKey.SCENE_GREEN_PLANT_CONF
,image.PropertyKey.SCENE_BEACH_CONF
,image.PropertyKey.SCENE_SNOW_CONF
,image.PropertyKey.SCENE_SUNSET_CONF
,image.PropertyKey.SCENE_FLOWERS_CONF
,image.PropertyKey.SCENE_NIGHT_CONF
,image.PropertyKey.SCENE_TEXT_CONF
,image.PropertyKey.FACE_COUNT
,image.PropertyKey.FACE_CONF
,image.PropertyKey.FACE_SMILE_SCORE
,image.PropertyKey.CAPTURE_MODE
,image.PropertyKey.BURST_NUMBER
,image.PropertyKey.FRONT_CAMERA
,image.PropertyKey.ROLL_ANGLE
,image.PropertyKey.PITCH_ANGLE
,image.PropertyKey.PHYSICAL_APERTURE
,image.PropertyKey.FOCUS_MODE
]
// ,image.PropertyKey.SCENE_POINTER
// ,image.PropertyKey.FACE_POINTER
// ,image.PropertyKey.FACE_VERSION
// ,image.PropertyKey.FACE_RECT
// ,image.PropertyKey.FACE_LEYE_CENTER
// ,image.PropertyKey.FACE_REYE_CENTER
// ,image.PropertyKey.FACE_MOUTH_CENTER

// const CUVAHdrExpectedValue = new Map<string, ModifyRule>([
//     ["NewSubfileType", {key: "newSubfileType", expectValue: undefined}],
//     ["SubfileType", {key: "subfileType", expectValue: undefined}],
//     ["ImageWidth", {key: "imageWidth", exceptValue: undefined}]
//     ["ImageLength", {key: "imageLength", expectValue: undefined}],
//     ["BitsPerSample", {key: "bitsPerSample", expectValue: undefined}],
//     ["Compression", {key: "compression", expectValue: undefined}],
//     ["PhotometricInterpretation", {key: "photometricInterpretation", expectValue: undefined}],
//     ["ImageDescription", {key: "imageDescription", expectValue: undefined}],
//     ["Make", {key: "make", expectValue: undefined}],
//     ["Model", {key: "model", expectValue: undefined}],
//     ["StripOffsets", {key: "stripOffsets", expectValue: undefined}],
//     ["Orientation", {key: "orientation", expectValue: undefined}],
//     ["SamplesPerPixel", {key: "samplesPerPixel", expectValue: undefined}],
//     ["RowsPerStrip", {key: "rowsPerStrip", expectValue: undefined}],
//     ["StripByteCounts", {key: "stripByteCounts", expectValue: undefined}],
//     ["XResolution", {key: "xResolution", expectValue: undefined}],
//     ["YResolution", {key: "yResolution", expectValue: undefined}],
//     ["PlanarConfiguration", {key: "planarConfiguration", expectValue: undefined}],
//     ["ResolutionUnit", {key: "resolutionUnit", expectValue: undefined}],
//     ["TransferFunction", {key: "transferFunction", expectValue: undefined}],
//     ["Software", {key: "software", expectValue: undefined}],
//     ["DateTime", {key: "dateTime", expectValue: undefined}],
//     ["Artist", {key: "artist", expectValue: undefined}],
//     ["WhitePoint", {key: "whitePoint", expectValue: undefined}],
//     ["PrimaryChromaticities", {key: "primaryChromaticities", expectValue: undefined}],
//     ["PhotoMode", {key: "photoMode", expectValue: undefined}],
//     ["JPEGInterchangeFormat", {key: "jPEGInterchangeFormat", expectValue: undefined}],
//     ["JPEGInterchangeFormatLength", {key: "jPEGInterchangeFormatLength", expectValue: undefined}],
//     ["YCbCrCoefficients", {key: "yCbCrCoefficients", expectValue: undefined}],
//     ["YCbCrSubSampling", {key: "yCbCrSubSampling", expectValue: undefined}],
//     ["YCbCrPositioning", {key: "yCbCrPositioning", expectValue: undefined}],
//     ["ReferenceBlackWhite", {key: "referenceBlackWhite", expectValue: undefined}],
//     ["Copyright", {key: "copyright", expectValue: undefined}],
//     ["ExposureTime", {key: "exposureTime", expectValue: undefined}],
//     ["FNumber", {key: "fNumber", expectValue: undefined}],
//     ["ExposureProgram", {key: "exposureProgram", expectValue: undefined}],
//     ["SpectralSensitivity", {key: "spectralSensitivity", expectValue: undefined}],
//     ["GPSVersionID", {key: "gPSVersionID", expectValue: undefined}],
//     ["GPSLatitudeRef", {key: "gPSLatitudeRef", expectValue: undefined}],
//     ["GPSLatitude", {key: "gPSLatitude", expectValue: undefined}],
//     ["GPSLongitudeRef", {key: "gPSLongitudeRef", expectValue: undefined}],
//     ["GPSLongitude", {key: "gPSLongitude", expectValue: undefined}],
//     ["GPSAltitudeRef", {key: "gPSAltitudeRef", expectValue: undefined}],
//     ["GPSAltitude", {key: "gPSAltitude", expectValue: undefined}],
//     ["GPSTimeStamp", {key: "gPSTimeStamp", expectValue: undefined}],
//     ["GPSSatellites", {key: "gPSSatellites", expectValue: undefined}],
//     ["GPSStatus", {key: "gPSStatus", expectValue: undefined}],
//     ["GPSMeasureMode", {key: "gPSMeasureMode", expectValue: undefined}],
//     ["GPSDOP", {key: "gPSDOP", expectValue: undefined}],
//     ["GPSSpeedRef", {key: "gPSSpeedRef", expectValue: undefined}],
//     ["GPSSpeed", {key: "gPSSpeed", expectValue: undefined}],
//     ["GPSTrackRef", {key: "gPSTrackRef", expectValue: undefined}],
//     ["GPSTrack", {key: "gPSTrack", expectValue: undefined}],
//     ["GPSImgDirectionRef", {key: "gPSImgDirectionRef", expectValue: undefined}],
//     ["GPSImgDirection", {key: "gPSImgDirection", expectValue: undefined}],
//     ["GPSMapDatum", {key: "gPSMapDatum", expectValue: undefined}],
//     ["GPSDestLatitudeRef", {key: "gPSDestLatitudeRef", expectValue: undefined}],
//     ["GPSDestLatitude", {key: "gPSDestLatitude", expectValue: undefined}],
//     ["GPSDestLongitudeRef", {key: "gPSDestLongitudeRef", expectValue: undefined}],
//     ["GPSDestLongitude", {key: "gPSDestLongitude", expectValue: undefined}],
//     ["GPSDestBearingRef", {key: "gPSDestBearingRef", expectValue: undefined}],
//     ["GPSDestBearing", {key: "gPSDestBearing", expectValue: undefined}],
//     ["GPSDestDistanceRef", {key: "gPSDestDistanceRef", expectValue: undefined}],
//     ["GPSDestDistance", {key: "gPSDestDistance", expectValue: undefined}],
//     ["GPSProcessingMethod", {key: "gPSProcessingMethod", expectValue: undefined}],
//     ["GPSAreaInformation", {key: "gPSAreaInformation", expectValue: undefined}],
//     ["GPSDateStamp", {key: "gPSDateStamp", expectValue: undefined}],
//     ["GPSDifferential", {key: "gPSDifferential", expectValue: undefined}],
//     ["GPSHPositioningError", {key: "gPSHPositioningError", expectValue: undefined}],
//     ["ISOSpeedRatings", {key: "iSOSpeedRatings", expectValue: undefined}],
//     ["PhotographicSensitivity", {key: "photographicSensitivity", expectValue: undefined}],
//     ["OECF", {key: "oECF", expectValue: undefined}],
//     ["SensitivityType", {key: "sensitivityType", expectValue: undefined}],
//     ["StandardOutputSensitivity", {key: "standardOutputSensitivity", expectValue: undefined}],
//     ["RecommendedExposureIndex", {key: "recommendedExposureIndex", expectValue: undefined}],
//     ["ISOSpeed", {key: "iSOSpeed", expectValue: undefined}],
//     ["ISOSpeedLatitudeyyy", {key: "iSOSpeedLatitudeyyy", expectValue: undefined}],
//     ["ISOSpeedLatitudezzz", {key: "iSOSpeedLatitudezzz", expectValue: undefined}],
//     ["ExifVersion", {key: "exifVersion", expectValue: undefined}],
//     ["DateTimeOriginal", {key: "dateTimeOriginal", expectValue: undefined}],
//     ["DateTimeDigitized", {key: "dateTimeDigitized", expectValue: undefined}],
//     ["OffsetTime", {key: "offsetTime", expectValue: undefined}],
//     ["OffsetTimeOriginal", {key: "offsetTimeOriginal", expectValue: undefined}],
//     ["OffsetTimeDigitized", {key: "offsetTimeDigitized", expectValue: undefined}],
//     ["ComponentsConfiguration", {key: "componentsConfiguration", expectValue: undefined}],
//     ["CompressedBitsPerPixel", {key: "compressedBitsPerPixel", expectValue: undefined}],
//     ["ShutterSpeedValue", {key: "shutterSpeedValue", expectValue: undefined}],
//     ["ApertureValue", {key: "apertureValue", expectValue: undefined}],
//     ["BrightnessValue", {key: "brightnessValue", expectValue: undefined}],
//     ["ExposureBiasValue", {key: "exposureBiasValue", expectValue: undefined}],
//     ["MaxApertureValue", {key: "maxApertureValue", expectValue: undefined}],
//     ["SubjectDistance", {key: "subjectDistance", expectValue: undefined}],
//     ["MeteringMode", {key: "meteringMode", expectValue: undefined}],
//     ["LightSource", {key: "lightSource", expectValue: undefined}],
//     ["Flash", {key: "flash", expectValue: undefined}],
//     ["FocalLength", {key: "focalLength", expectValue: undefined}],
//     ["SubjectArea", {key: "subjectArea", expectValue: undefined}],
//     ["MakerNote", {key: "makerNote", expectValue: undefined}],
//     ["UserComment", {key: "UserComment", expectValue: undefined}],
//     ["SubsecTime", {key: "subsecTime", expectValue: undefined}],
//     ["SubsecTimeOriginal", {key: "subsecTimeOriginal", expectValue: undefined}],
//     ["SubsecTimeDigitized", {key: "subsecTimeDigitized", expectValue: undefined}],
//     ["FlashpixVersion", {key: "flashpixVersion", expectValue: undefined}],
//     ["ColorSpace", {key: "colorSpace", expectValue: undefined}],
//     ["PixelXDimension", {key: "pixelXDimension", expectValue: undefined}],
//     ["PixelYDimension", {key: "pixelYDimension", expectValue: undefined}],
//     ["RelatedSoundFile", {key: "relatedSoundFile", expectValue: undefined}],
//     ["FlashEnergy", {key: "flashEnergy", expectValue: undefined}],
//     ["SpatialFrequencyResponse", {key: "spatialFrequencyResponse", expectValue: undefined}],
//     ["FocalPlaneXResolution", {key: "focalPlaneXResolution", expectValue: undefined}],
//     ["FocalPlaneYResolution", {key: "focalPlaneYResolution", expectValue: undefined}],
//     ["FocalPlaneResolutionUnit", {key: "focalPlaneResolutionUnit", expectValue: undefined}],
//     ["SubjectLocation", {key: "subjectLocation", expectValue: undefined}],
//     ["ExposureIndex", {key: "exposureIndex", expectValue: undefined}],
//     ["SensingMethod", {key: "sensingMethod", expectValue: undefined}],
//     ["FileSource", {key: "fileSource", expectValue: undefined}],
//     ["SceneType", {key: "sceneType", expectValue: undefined}],
//     ["CFAPattern", {key: "cFAPattern", expectValue: undefined}],
//     ["CustomRendered", {key: "customRendered", expectValue: undefined}],
//     ["ExposureMode", {key: "exposureMode", expectValue: undefined}],
//     ["WhiteBalance", {key: "whiteBalance", expectValue: undefined}],
//     ["DigitalZoomRatio", {key: "digitalZoomRatio", expectValue: undefined}],
//     ["FocalLengthIn35mmFilm", {key: "focalLengthIn35mmFilm", expectValue: undefined}],
//     ["SceneCaptureType", {key: "sceneCaptureType", expectValue: undefined}],
//     ["GainControl", {key: "gainControl", expectValue: undefined}],
//     ["Contrast", {key: "contrast", expectValue: undefined}],
//     ["Saturation", {key: "saturation", expectValue: undefined}],
//     ["Sharpness", {key: "sharpness", expectValue: undefined}],
//     ["DeviceSettingDescription", {key: "deviceSettingDescription", expectValue: undefined}],
//     ["SubjectDistanceRange", {key: "subjectDistanceRange", expectValue: undefined}],
//     ["ImageUniqueID", {key: "imageUniqueID", expectValue: undefined}],
//     ["CameraOwnerName", {key: "cameraOwnerName", expectValue: undefined}],
//     ["BodySerialNumber", {key: "bodySerialNumber", expectValue: undefined}],
//     ["LensSpecification", {key: "lensSpecification", expectValue: undefined}],
//     ["LensMake", {key: "lensMake", expectValue: undefined}],
//     ["LensModel", {key: "lensModel", expectValue: undefined}],
//     ["LensSerialNumber", {key: "lensSerialNumber", expectValue: undefined}],
//     ["CompositeImage", {key: "compositeImage", expectValue: undefined}],
//     ["SourceImageNumberOfCompositeImage", {key: "sourceImageNumberOfCompositeImage", expectValue: undefined}],
//     ["SourceExposureTimesOfCompositeImage", {key: "sourceExposureTimesOfCompositeImage", expectValue: undefined}],
//     ["Gamma", {key: "gamma", expectValue: undefined}],
//     ["DNGVersion", {key: "dNGVersion", expectValue: undefined}],
//     ["DefaultCropSize", {key: "defaultCropSize", expectValue: undefined}],
//     ["GIFLoopCount", {key: "gIFLoopCount", expectValue: undefined}],
//     ["HwMnoteIsXmageSupported", {key: "isXmageSupported", expectValue: undefined}],
//     ["HwMnoteXmageMode", {key: "xmageMode", expectValue: undefined}],
//     ["HwMnoteXmageLeft", {key: "xmageLeft", expectValue: undefined}],
//     ["HwMnoteXmageTop", {key: "xmageTop", expectValue: undefined}],
//     ["HwMnoteXmageRight", {key: "xmageRight", expectValue: undefined}],
//     ["HwMnoteXmageBottom", {key: "xmageBottom", expectValue: undefined}],
//     ["HwMnoteCloudEnhancementMode", {key: "cloudEnhancementMode", expectValue: undefined}],
//     ["HwMnoteWindSnapshotMode", {key: "windSnapshotMode", expectValue: undefined}],
//     ["HwMnoteScenePointer", {key: "scenePointer", expectValue: undefined}],
//     ["HwMnoteSceneVersion", {key: "sceneVersion", expectValue: undefined}],
//     ["HwMnoteSceneFoodConf", {key: "sceneFoodConf", expectValue: undefined}],
//     ["HwMnoteSceneStageConf", {key: "sceneStageConf", expectValue: undefined}],
//     ["HwMnoteSceneBlueSkyConf", {key: "sceneBlueSkyConf", expectValue: undefined}],
//     ["HwMnoteSceneGreenPlantConf", {key: "sceneGreenPlantConf", expectValue: undefined}],
//     ["HwMnoteSceneBeachConf", {key: "sceneBeachConf", expectValue: undefined}],
//     ["HwMnoteSceneSnowConf", {key: "sceneSnowConf", expectValue: undefined}],
//     ["HwMnoteSceneSunsetConf", {key: "sceneSunsetConf", expectValue: undefined}],
//     ["HwMnoteSceneFlowersConf", {key: "sceneFlowersConf", expectValue: undefined}],
//     ["HwMnoteSceneNightConf", {key: "sceneNightConf", expectValue: undefined}],
//     ["HwMnoteSceneTextConf", {key: "sceneTextConf", expectValue: undefined}],
//     ["HwMnoteFacePointer", {key: "facePointer", expectValue: undefined}],
//     ["HwMnoteFaceVersion", {key: "faceVersion", expectValue: undefined}],
//     ["HwMnoteFaceCount", {key: "faceCount", expectValue: undefined}],
//     ["HwMnoteFaceConf", {key: "faceConf", expectValue: undefined}],
//     ["HwMnoteFaceSmileScore", {key: "faceSmileScore", expectValue: undefined}],
//     ["HwMnoteFaceRect", {key: "faceRect", expectValue: undefined}],
//     ["HwMnoteFaceLeyeCenter", {key: "faceLeyeCenter", expectValue: undefined}],
//     ["HwMnoteFaceReyeCenter", {key: "faceReyeCenter", expectValue: undefined}],
//     ["HwMnoteFaceMouthCenter", {key: "faceMouthCenter", expectValue: undefined}],
//     ["HwMnoteCaptureMode", {key: "captureMode", expectValue: undefined}],
//     ["HwMnoteBurstNumber", {key: "burstNumber", expectValue: undefined}],
//     ["HwMnoteFrontCamera", {key: "frontCamera", expectValue: undefined}],
//     ["HwMnoteRollAngle", {key: "rollAngle", expectValue: undefined}],
//     ["HwMnotePitchAngle", {key: "pitchAngle", expectValue: undefined}],
//     ["HwMnotePhysicalAperture", {key: "physicalAperture", expectValue: undefined}],
//     ["HwMnoteFocusMode", {key: "focusMode", expectValue: undefined}]
// ])

// CUVAHdr.jpg
const CUVAHdrExpectedValue = new Map<string, ModifyRule>([
    ["NewSubfileType", {key: "newSubfileType", expectValue: undefined}],
    ["SubfileType", {key: "subfileType", expectValue: undefined}],
    ["ImageWidth", {key: "imageWidth", expectValue: "3072"}],
    ["ImageLength", {key: "imageLength", expectValue: "4096"}],
    ["BitsPerSample", {key: "bitsPerSample", expectValue: "8, 8, 8"}],
    ["Compression", {key: "compression", expectValue: "JPEG compression"}],
    ["PhotometricInterpretation", {key: "photometricInterpretation", expectValue: undefined}],
    ["ImageDescription", {key: "imageDescription", expectValue: undefined}],
    ["StripOffsets", {key: "stripOffsets", expectValue: undefined}],
    ["Orientation", {key: "orientation", expectValue: "Unknown value 0"}],
    ["SamplesPerPixel", {key: "samplesPerPixel", expectValue: undefined}],
    ["RowsPerStrip", {key: "rowsPerStrip", expectValue: undefined}],
    ["StripByteCounts", {key: "stripByteCounts", expectValue: undefined}],
    ["XResolution", {key: "xResolution", expectValue: "72"}],
    ["YResolution", {key: "yResolution", expectValue: "72"}],
    ["PlanarConfiguration", {key: "planarConfiguration", expectValue: undefined}],
    ["ResolutionUnit", {key: "resolutionUnit", expectValue: "Inch"}],
    ["TransferFunction", {key: "transferFunction", expectValue: undefined}],
    ["Software", {key: "software", expectValue: "ALN-AL80 4.0.0.126(SP2C00E125R4P12)"}],
    ["DateTime", {key: "dateTime", expectValue: "2023:11:11 16:18:50"}],
    ["Artist", {key: "artist", expectValue: undefined}],
    ["WhitePoint", {key: "whitePoint", expectValue: undefined}],
    ["PrimaryChromaticities", {key: "primaryChromaticities", expectValue: undefined}],
    ["PhotoMode", {key: "photoMode", expectValue: undefined}],
    ["JPEGInterchangeFormat", {key: "jPEGInterchangeFormat", expectValue: "1522"}],
    ["JPEGInterchangeFormatLength", {key: "jPEGInterchangeFormatLength", expectValue: "37504"}],
    ["YCbCrCoefficients", {key: "yCbCrCoefficients", expectValue: undefined}],
    ["YCbCrSubSampling", {key: "yCbCrSubSampling", expectValue: undefined}],
    ["YCbCrPositioning", {key: "yCbCrPositioning", expectValue: "Centered"}],
    ["ReferenceBlackWhite", {key: "referenceBlackWhite", expectValue: undefined}],
    ["Copyright", {key: "copyright", expectValue: undefined}],
    ["ExposureTime", {key: "exposureTime", expectValue: "1/50 sec."}],
    ["FNumber", {key: "fNumber", expectValue: "f/2.0"}],
    ["ExposureProgram", {key: "exposureProgram", expectValue: "Normal program"}],
    ["SpectralSensitivity", {key: "spectralSensitivity", expectValue: undefined}],
    ["GPSVersionID", {key: "gPSVersionID", expectValue: "0.0.0.0"}],
    ["GPSLatitudeRef", {key: "gPSLatitudeRef", expectValue: null}],
    ["GPSLatitude", {key: "gPSLatitude", expectValue: "0/0, 0/0, 0/0"}],
    ["GPSLongitudeRef", {key: "gPSLongitudeRef", expectValue: null}],
    ["GPSLongitude", {key: "gPSLongitude", expectValue: "0/0, 0/0, 0/0"}],
    ["GPSAltitudeRef", {key: "gPSAltitudeRef", expectValue: "Sea level"}],
    ["GPSAltitude", {key: "gPSAltitude", expectValue: "0/0"}],
    ["GPSTimeStamp", {key: "gPSTimeStamp", expectValue: "0/0, 0/0, 0/0"}],
    ["GPSSatellites", {key: "gPSSatellites", expectValue: undefined}],
    ["GPSStatus", {key: "gPSStatus", expectValue: undefined}],
    ["GPSMeasureMode", {key: "gPSMeasureMode", expectValue: undefined}],
    ["GPSDOP", {key: "gPSDOP", expectValue: undefined}],
    ["GPSSpeedRef", {key: "gPSSpeedRef", expectValue: undefined}],
    ["GPSSpeed", {key: "gPSSpeed", expectValue: undefined}],
    ["GPSTrackRef", {key: "gPSTrackRef", expectValue: undefined}],
    ["GPSTrack", {key: "gPSTrack", expectValue: undefined}],
    ["GPSImgDirectionRef", {key: "gPSImgDirectionRef", expectValue: undefined}],
    ["GPSImgDirection", {key: "gPSImgDirection", expectValue: undefined}],
    ["GPSMapDatum", {key: "gPSMapDatum", expectValue: undefined}],
    ["GPSDestLatitudeRef", {key: "gPSDestLatitudeRef", expectValue: undefined}],
    ["GPSDestLatitude", {key: "gPSDestLatitude", expectValue: undefined}],
    ["GPSDestLongitudeRef", {key: "gPSDestLongitudeRef", expectValue: undefined}],
    ["GPSDestLongitude", {key: "gPSDestLongitude", expectValue: undefined}],
    ["GPSDestBearingRef", {key: "gPSDestBearingRef", expectValue: undefined}],
    ["GPSDestBearing", {key: "gPSDestBearing", expectValue: undefined}],
    ["GPSDestDistanceRef", {key: "gPSDestDistanceRef", expectValue: undefined}],
    ["GPSDestDistance", {key: "gPSDestDistance", expectValue: undefined}],
    ["GPSProcessingMethod", {key: "gPSProcessingMethod", expectValue: null}],
    ["GPSAreaInformation", {key: "gPSAreaInformation", expectValue: undefined}],
    ["GPSDateStamp", {key: "gPSDateStamp", expectValue: null}],
    ["GPSDifferential", {key: "gPSDifferential", expectValue: undefined}],
    ["GPSHPositioningError", {key: "gPSHPositioningError", expectValue: undefined}],
    ["ISOSpeedRatings", {key: "iSOSpeedRatings", expectValue: "320"}],
    ["PhotographicSensitivity", {key: "photographicSensitivity", expectValue: "320"}],
    ["OECF", {key: "oECF", expectValue: undefined}],
    ["SensitivityType", {key: "sensitivityType", expectValue: undefined}],
    ["StandardOutputSensitivity", {key: "standardOutputSensitivity", expectValue: undefined}],
    ["RecommendedExposureIndex", {key: "recommendedExposureIndex", expectValue: undefined}],
    ["ISOSpeed", {key: "iSOSpeed", expectValue: "320"}],
    ["ISOSpeedLatitudeyyy", {key: "iSOSpeedLatitudeyyy", expectValue: undefined}],
    ["ISOSpeedLatitudezzz", {key: "iSOSpeedLatitudezzz", expectValue: undefined}],
    ["ExifVersion", {key: "exifVersion", expectValue: "Exif Version 2.1"}],
    ["DateTimeOriginal", {key: "dateTimeOriginal", expectValue: "2023:11:11 16:18:50"}],
    ["DateTimeDigitized", {key: "dateTimeDigitized", expectValue: "2023:11:11 16:18:50"}],
    ["OffsetTime", {key: "offsetTime", expectValue: undefined}],
    ["OffsetTimeOriginal", {key: "offsetTimeOriginal", expectValue: undefined}],
    ["OffsetTimeDigitized", {key: "offsetTimeDigitized", expectValue: undefined}],
    ["ComponentsConfiguration", {key: "componentsConfiguration", expectValue: "Y Cb Cr -"}],
    ["CompressedBitsPerPixel", {key: "compressedBitsPerPixel", expectValue: "0.95"}],
    ["ShutterSpeedValue", {key: "shutterSpeedValue", expectValue: "29.90 EV (1/999963365 sec.)"}],
    ["ApertureValue", {key: "apertureValue", expectValue: "2.00 EV (f/2.0)"}],
    ["BrightnessValue", {key: "brightnessValue", expectValue: "0.00 EV (3.43 cd/m^2)"}],
    ["ExposureBiasValue", {key: "exposureBiasValue", expectValue: "0.00 EV"}],
    ["MaxApertureValue", {key: "maxApertureValue", expectValue: "2.00 EV (f/2.0)"}],
    ["SubjectDistance", {key: "subjectDistance", expectValue: undefined}],
    ["MeteringMode", {key: "meteringMode", expectValue: "Pattern"}],
    ["LightSource", {key: "lightSource", expectValue: "Daylight"}],
    ["Flash", {key: "flash", expectValue: "Flash did not fire"}],
    ["FocalLength", {key: "focalLength", expectValue: "5.8 mm"}],
    ["SubjectArea", {key: "subjectArea", expectValue: undefined}],
    ["MakerNote", {key: "makerNote", expectValue: "HwMnoteScenePointer:74,HwMnoteSceneVersion:1207959808,HwMnoteSceneFlowersConf:100,HwMnoteFacePointer:104,HwMnoteFaceVersion:1207959808,HwMnoteCaptureMode:0,HwMnoteFrontCamera:0,HwMnotePhysicalAperture:1"}],
    ["UserComment", {key: "UserComment", expectValue: undefined}],
    ["SubsecTime", {key: "subsecTime", expectValue: "663000"}],
    ["SubsecTimeOriginal", {key: "subsecTimeOriginal", expectValue: "663000"}],
    ["SubsecTimeDigitized", {key: "subsecTimeDigitized", expectValue: "663000"}],
    ["FlashpixVersion", {key: "flashpixVersion", expectValue: "FlashPix Version 1.0"}],
    ["ColorSpace", {key: "colorSpace", expectValue: "Uncalibrated"}],
    ["PixelXDimension", {key: "pixelXDimension", expectValue: "3072"}],
    ["PixelYDimension", {key: "pixelYDimension", expectValue: "4096"}],
    ["RelatedSoundFile", {key: "relatedSoundFile", expectValue: undefined}],
    ["FlashEnergy", {key: "flashEnergy", expectValue: undefined}],
    ["SpatialFrequencyResponse", {key: "spatialFrequencyResponse", expectValue: undefined}],
    ["FocalPlaneXResolution", {key: "focalPlaneXResolution", expectValue: undefined}],
    ["FocalPlaneYResolution", {key: "focalPlaneYResolution", expectValue: undefined}],
    ["FocalPlaneResolutionUnit", {key: "focalPlaneResolutionUnit", expectValue: undefined}],
    ["SubjectLocation", {key: "subjectLocation", expectValue: undefined}],
    ["ExposureIndex", {key: "exposureIndex", expectValue: undefined}],
    ["SensingMethod", {key: "sensingMethod", expectValue: "One-chip color area sensor"}],
    ["FileSource", {key: "fileSource", expectValue: "DSC"}],
    ["SceneType", {key: "sceneType", expectValue: "Directly photographed"}],
    ["CFAPattern", {key: "cFAPattern", expectValue: undefined}],
    ["CustomRendered", {key: "customRendered", expectValue: "Custom process"}],
    ["ExposureMode", {key: "exposureMode", expectValue: "Auto exposure"}],
    ["WhiteBalance", {key: "whiteBalance", expectValue: "Auto white balance"}],
    ["DigitalZoomRatio", {key: "digitalZoomRatio", expectValue: "1.00"}],
    ["FocalLengthIn35mmFilm", {key: "focalLengthIn35mmFilm", expectValue: "27"}],
    ["SceneCaptureType", {key: "sceneCaptureType", expectValue: "Standard"}],
    ["GainControl", {key: "gainControl", expectValue: "Normal"}],
    ["Contrast", {key: "contrast", expectValue: "Normal"}],
    ["Saturation", {key: "saturation", expectValue: "Normal"}],
    ["Sharpness", {key: "sharpness", expectValue: "Normal"}],
    ["DeviceSettingDescription", {key: "deviceSettingDescription", expectValue: "ipp."}],
    ["SubjectDistanceRange", {key: "subjectDistanceRange", expectValue: "Unknown"}],
    ["ImageUniqueID", {key: "imageUniqueID", expectValue: undefined}],
    ["CameraOwnerName", {key: "cameraOwnerName", expectValue: undefined}],
    ["BodySerialNumber", {key: "bodySerialNumber", expectValue: undefined}],
    ["LensSpecification", {key: "lensSpecification", expectValue: undefined}],
    ["LensMake", {key: "lensMake", expectValue: undefined}],
    ["LensModel", {key: "lensModel", expectValue: undefined}],
    ["LensSerialNumber", {key: "lensSerialNumber", expectValue: undefined}],
    ["CompositeImage", {key: "compositeImage", expectValue: undefined}],
    ["SourceImageNumberOfCompositeImage", {key: "sourceImageNumberOfCompositeImage", expectValue: undefined}],
    ["SourceExposureTimesOfCompositeImage", {key: "sourceExposureTimesOfCompositeImage", expectValue: undefined}],
    ["Gamma", {key: "gamma", expectValue: undefined}],
    ["DNGVersion", {key: "dNGVersion", expectValue: undefined}],
    ["DefaultCropSize", {key: "defaultCropSize", expectValue: undefined}],
    ["GIFLoopCount", {key: "gIFLoopCount", expectValue: undefined}],
    ["HwMnoteIsXmageSupported", {key: "isXmageSupported", expectValue: "default_exif_value"}],
    ["HwMnoteXmageMode", {key: "xmageWatermarkMode", expectValue: "default_exif_value"}],
    ["HwMnoteXmageLeft", {key: "xmageLeft", expectValue: "default_exif_value"}],
    ["HwMnoteXmageTop", {key: "xmageTop", expectValue: "default_exif_value"}],
    ["HwMnoteXmageRight", {key: "xmageRight", expectValue: "default_exif_value"}],
    ["HwMnoteXmageBottom", {key: "xmageBottom", expectValue: "default_exif_value"}],
    ["HwMnoteCloudEnhancementMode", {key: "isCloudEnhancement", expectValue: "default_exif_value"}],
    ["HwMnoteWindSnapshotMode", {key: "windSnapshotMode", expectValue: "default_exif_value"}],
    ["HwMnoteSceneVersion", {key: "sceneVersion", expectValue: "1207959808"}],
    ["HwMnoteSceneFoodConf", {key: "sceneFoodConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneStageConf", {key: "sceneStageConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneBlueSkyConf", {key: "sceneBlueSkyConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneGreenPlantConf", {key: "sceneGreenPlantConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneBeachConf", {key: "sceneBeachConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneSnowConf", {key: "sceneSnowConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneSunsetConf", {key: "sceneSunsetConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneFlowersConf", {key: "sceneFlowersConf", expectValue: "100"}],
    ["HwMnoteSceneNightConf", {key: "sceneNightConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneTextConf", {key: "sceneTextConf", expectValue: "default_exif_value"}],
    ["HwMnoteFaceConf", {key: "faceConf", expectValue: "default_exif_value"}],
    ["HwMnoteFaceSmileScore", {key: "faceSmileScore", expectValue: "default_exif_value"}],
    ["HwMnoteCaptureMode", {key: "captureMode", expectValue: "0"}],
    ["HwMnoteBurstNumber", {key: "burstNumber", expectValue: "default_exif_value"}],
    ["HwMnoteFrontCamera", {key: "frontCamera", expectValue: "0"}],
    ["HwMnoteRollAngle", {key: "rollAngle", expectValue: "default_exif_value"}],
    ["HwMnotePitchAngle", {key: "pitchAngle", expectValue: "default_exif_value"}],
    ["HwMnotePhysicalAperture", {key: "physicalAperture", expectValue: "1"}],
    ["HwMnoteFocusMode", {key: "focusMode", expectValue: "default_exif_value"}],
    ["HwMnoteFaceCount", {key: "faceCount", expectValue: "default_exif_value"}], // 系统只读key
])

// CUVAHdrMulti.jpg
const CUVAHdrMultiExpectedValue = new Map<string, ModifyRule>([
    ["NewSubfileType", {key: "newSubfileType", expectValue: undefined}],
    ["SubfileType", {key: "subfileType", expectValue: undefined}],
    ["ImageWidth", {key: "imageWidth", expectValue: "4000"}],
    ["ImageLength", {key: "imageLength", expectValue: "3000"}],
    ["BitsPerSample", {key: "bitsPerSample", expectValue: "8, 8, 8"}],
    ["Compression", {key: "compression", expectValue: undefined}],
    ["PhotometricInterpretation", {key: "photometricInterpretation", expectValue: undefined}],
    ["ImageDescription", {key: "imageDescription", expectValue: "_cuva"}],
    ["StripOffsets", {key: "stripOffsets", expectValue: undefined}],
    ["Orientation", {key: "orientation", expectValue: "Unknown value 0"}],
    ["SamplesPerPixel", {key: "samplesPerPixel", expectValue: undefined}],
    ["RowsPerStrip", {key: "rowsPerStrip", expectValue: undefined}],
    ["StripByteCounts", {key: "stripByteCounts", expectValue: undefined}],
    ["XResolution", {key: "xResolution", expectValue: "72"}],
    ["YResolution", {key: "yResolution", expectValue: "72"}],
    ["PlanarConfiguration", {key: "planarConfiguration", expectValue: undefined}],
    ["ResolutionUnit", {key: "resolutionUnit", expectValue: "Inch"}],
    ["TransferFunction", {key: "transferFunction", expectValue: undefined}],
    ["Software", {key: "software", expectValue: "unknown"}],
    ["DateTime", {key: "dateTime", expectValue: "2023:08:18 10:20:01"}],
    ["Artist", {key: "artist", expectValue: undefined}],
    ["WhitePoint", {key: "whitePoint", expectValue: undefined}],
    ["PrimaryChromaticities", {key: "primaryChromaticities", expectValue: undefined}],
    ["PhotoMode", {key: "photoMode", expectValue: undefined}],
    ["JPEGInterchangeFormat", {key: "jPEGInterchangeFormat", expectValue: undefined}],
    ["JPEGInterchangeFormatLength", {key: "jPEGInterchangeFormatLength", expectValue: undefined}],
    ["YCbCrCoefficients", {key: "yCbCrCoefficients", expectValue: undefined}],
    ["YCbCrSubSampling", {key: "yCbCrSubSampling", expectValue: undefined}],
    ["YCbCrPositioning", {key: "yCbCrPositioning", expectValue: "Centered"}],
    ["ReferenceBlackWhite", {key: "referenceBlackWhite", expectValue: undefined}],
    ["Copyright", {key: "copyright", expectValue: undefined}],
    ["ExposureTime", {key: "exposureTime", expectValue: "1/100 sec."}],
    ["FNumber", {key: "fNumber", expectValue: "f/2.0"}],
    ["ExposureProgram", {key: "exposureProgram", expectValue: "Normal program"}],
    ["SpectralSensitivity", {key: "spectralSensitivity", expectValue: undefined}],
    ["GPSVersionID", {key: "gPSVersionID", expectValue: undefined}],
    ["GPSLatitudeRef", {key: "gPSLatitudeRef", expectValue: undefined}],
    ["GPSLatitude", {key: "gPSLatitude", expectValue: undefined}],
    ["GPSLongitudeRef", {key: "gPSLongitudeRef", expectValue: undefined}],
    ["GPSLongitude", {key: "gPSLongitude", expectValue: undefined}],
    ["GPSAltitudeRef", {key: "gPSAltitudeRef", expectValue: undefined}],
    ["GPSAltitude", {key: "gPSAltitude", expectValue: undefined}],
    ["GPSTimeStamp", {key: "gPSTimeStamp", expectValue: undefined}],
    ["GPSSatellites", {key: "gPSSatellites", expectValue: undefined}],
    ["GPSStatus", {key: "gPSStatus", expectValue: undefined}],
    ["GPSMeasureMode", {key: "gPSMeasureMode", expectValue: undefined}],
    ["GPSDOP", {key: "gPSDOP", expectValue: undefined}],
    ["GPSSpeedRef", {key: "gPSSpeedRef", expectValue: undefined}],
    ["GPSSpeed", {key: "gPSSpeed", expectValue: undefined}],
    ["GPSTrackRef", {key: "gPSTrackRef", expectValue: undefined}],
    ["GPSTrack", {key: "gPSTrack", expectValue: undefined}],
    ["GPSImgDirectionRef", {key: "gPSImgDirectionRef", expectValue: undefined}],
    ["GPSImgDirection", {key: "gPSImgDirection", expectValue: undefined}],
    ["GPSMapDatum", {key: "gPSMapDatum", expectValue: undefined}],
    ["GPSDestLatitudeRef", {key: "gPSDestLatitudeRef", expectValue: undefined}],
    ["GPSDestLatitude", {key: "gPSDestLatitude", expectValue: undefined}],
    ["GPSDestLongitudeRef", {key: "gPSDestLongitudeRef", expectValue: undefined}],
    ["GPSDestLongitude", {key: "gPSDestLongitude", expectValue: undefined}],
    ["GPSDestBearingRef", {key: "gPSDestBearingRef", expectValue: undefined}],
    ["GPSDestBearing", {key: "gPSDestBearing", expectValue: undefined}],
    ["GPSDestDistanceRef", {key: "gPSDestDistanceRef", expectValue: undefined}],
    ["GPSDestDistance", {key: "gPSDestDistance", expectValue: undefined}],
    ["GPSProcessingMethod", {key: "gPSProcessingMethod", expectValue: undefined}],
    ["GPSAreaInformation", {key: "gPSAreaInformation", expectValue: undefined}],
    ["GPSDateStamp", {key: "gPSDateStamp", expectValue: undefined}],
    ["GPSDifferential", {key: "gPSDifferential", expectValue: undefined}],
    ["GPSHPositioningError", {key: "gPSHPositioningError", expectValue: undefined}],
    ["ISOSpeedRatings", {key: "iSOSpeedRatings", expectValue: "400"}],
    ["PhotographicSensitivity", {key: "photographicSensitivity", expectValue: "400"}],
    ["OECF", {key: "oECF", expectValue: undefined}],
    ["SensitivityType", {key: "sensitivityType", expectValue: undefined}],
    ["StandardOutputSensitivity", {key: "standardOutputSensitivity", expectValue: undefined}],
    ["RecommendedExposureIndex", {key: "recommendedExposureIndex", expectValue: undefined}],
    ["ISOSpeed", {key: "iSOSpeed", expectValue: "400"}],
    ["ISOSpeedLatitudeyyy", {key: "iSOSpeedLatitudeyyy", expectValue: undefined}],
    ["ISOSpeedLatitudezzz", {key: "iSOSpeedLatitudezzz", expectValue: undefined}],
    ["ExifVersion", {key: "exifVersion", expectValue: "Exif Version 2.1"}],
    ["DateTimeOriginal", {key: "dateTimeOriginal", expectValue: "2023:08:18 10:20:01"}],
    ["DateTimeDigitized", {key: "dateTimeDigitized", expectValue: "2023:08:18 10:20:01"}],
    ["OffsetTime", {key: "offsetTime", expectValue: undefined}],
    ["OffsetTimeOriginal", {key: "offsetTimeOriginal", expectValue: undefined}],
    ["OffsetTimeDigitized", {key: "offsetTimeDigitized", expectValue: undefined}],
    ["ComponentsConfiguration", {key: "componentsConfiguration", expectValue: "Y Cb Cr -"}],
    ["CompressedBitsPerPixel", {key: "compressedBitsPerPixel", expectValue: undefined}],
    ["ShutterSpeedValue", {key: "shutterSpeedValue", expectValue: "29.00 EV (1/536870912 sec.)"}],
    ["ApertureValue", {key: "apertureValue", expectValue: "2.00 EV (f/2.0)"}],
    ["BrightnessValue", {key: "brightnessValue", expectValue: "-2.00 EV (0.86 cd/m^2)"}],
    ["ExposureBiasValue", {key: "exposureBiasValue", expectValue: "0.00 EV"}],
    ["MaxApertureValue", {key: "maxApertureValue", expectValue: undefined}],
    ["SubjectDistance", {key: "subjectDistance", expectValue: undefined}],
    ["MeteringMode", {key: "meteringMode", expectValue: "Pattern"}],
    ["LightSource", {key: "lightSource", expectValue: "Daylight"}],
    ["Flash", {key: "flash", expectValue: "Flash did not fire"}],
    ["FocalLength", {key: "focalLength", expectValue: "6.3 mm"}],
    ["SubjectArea", {key: "subjectArea", expectValue: undefined}],
    ["MakerNote", {key: "makerNote", expectValue: "HwMnoteScenePointer:170,HwMnoteSceneVersion:1207959808,HwMnoteFacePointer:188,HwMnoteFaceVersion:1207959808,HwMnoteCaptureMode:0,HwMnoteFrontCamera:0,HwMnoteRollAngle:-3,HwMnotePitchAngle:-72,HwMnotePhysicalAperture:1,HwMnoteIsXmageSupported:1,HwMnoteXmageMode:0,HwMnoteXmageLeft:0,HwMnoteXmageTop:0,HwMnoteXmageRight:0,HwMnoteXmageBottom:0"}],
    ["UserComment", {key: "UserComment", expectValue: undefined}],
    ["SubsecTime", {key: "subsecTime", expectValue: "210000"}],
    ["SubsecTimeOriginal", {key: "subsecTimeOriginal", expectValue: "210000"}],
    ["SubsecTimeDigitized", {key: "subsecTimeDigitized", expectValue: "210000"}],
    ["FlashpixVersion", {key: "flashpixVersion", expectValue: "FlashPix Version 1.0"}],
    ["ColorSpace", {key: "colorSpace", expectValue: "Uncalibrated"}],
    ["PixelXDimension", {key: "pixelXDimension", expectValue: "4000"}],
    ["PixelYDimension", {key: "pixelYDimension", expectValue: "3000"}],
    ["RelatedSoundFile", {key: "relatedSoundFile", expectValue: undefined}],
    ["FlashEnergy", {key: "flashEnergy", expectValue: undefined}],
    ["SpatialFrequencyResponse", {key: "spatialFrequencyResponse", expectValue: undefined}],
    ["FocalPlaneXResolution", {key: "focalPlaneXResolution", expectValue: undefined}],
    ["FocalPlaneYResolution", {key: "focalPlaneYResolution", expectValue: undefined}],
    ["FocalPlaneResolutionUnit", {key: "focalPlaneResolutionUnit", expectValue: undefined}],
    ["SubjectLocation", {key: "subjectLocation", expectValue: undefined}],
    ["ExposureIndex", {key: "exposureIndex", expectValue: undefined}],
    ["SensingMethod", {key: "sensingMethod", expectValue: "One-chip color area sensor"}],
    ["FileSource", {key: "fileSource", expectValue: "DSC"}],
    ["SceneType", {key: "sceneType", expectValue: "Directly photographed"}],
    ["CFAPattern", {key: "cFAPattern", expectValue: undefined}],
    ["CustomRendered", {key: "customRendered", expectValue: "Custom process"}],
    ["ExposureMode", {key: "exposureMode", expectValue: "Auto exposure"}],
    ["WhiteBalance", {key: "whiteBalance", expectValue: "Auto white balance"}],
    ["DigitalZoomRatio", {key: "digitalZoomRatio", expectValue: undefined}],
    ["FocalLengthIn35mmFilm", {key: "focalLengthIn35mmFilm", expectValue: "27"}],
    ["SceneCaptureType", {key: "sceneCaptureType", expectValue: "Standard"}],
    ["GainControl", {key: "gainControl", expectValue: "Normal"}],
    ["Contrast", {key: "contrast", expectValue: "Normal"}],
    ["Saturation", {key: "saturation", expectValue: "Normal"}],
    ["Sharpness", {key: "sharpness", expectValue: "Normal"}],
    ["DeviceSettingDescription", {key: "deviceSettingDescription", expectValue: undefined}],
    ["SubjectDistanceRange", {key: "subjectDistanceRange", expectValue: "Unknown"}],
    ["ImageUniqueID", {key: "imageUniqueID", expectValue: undefined}],
    ["CameraOwnerName", {key: "cameraOwnerName", expectValue: undefined}],
    ["BodySerialNumber", {key: "bodySerialNumber", expectValue: undefined}],
    ["LensSpecification", {key: "lensSpecification", expectValue: undefined}],
    ["LensMake", {key: "lensMake", expectValue: undefined}],
    ["LensModel", {key: "lensModel", expectValue: undefined}],
    ["LensSerialNumber", {key: "lensSerialNumber", expectValue: undefined}],
    ["CompositeImage", {key: "compositeImage", expectValue: undefined}],
    ["SourceImageNumberOfCompositeImage", {key: "sourceImageNumberOfCompositeImage", expectValue: undefined}],
    ["SourceExposureTimesOfCompositeImage", {key: "sourceExposureTimesOfCompositeImage", expectValue: undefined}],
    ["Gamma", {key: "gamma", expectValue: undefined}],
    ["DNGVersion", {key: "dNGVersion", expectValue: undefined}],
    ["DefaultCropSize", {key: "defaultCropSize", expectValue: undefined}],
    ["GIFLoopCount", {key: "gIFLoopCount", expectValue: undefined}],
    ["HwMnoteIsXmageSupported", {key: "isXmageSupported", expectValue: "1"}],
    ["HwMnoteXmageMode", {key: "xmageWatermarkMode", expectValue: "0"}],
    ["HwMnoteXmageLeft", {key: "xmageLeft", expectValue: "0"}],
    ["HwMnoteXmageTop", {key: "xmageTop", expectValue: "0"}],
    ["HwMnoteXmageRight", {key: "xmageRight", expectValue: "0"}],
    ["HwMnoteXmageBottom", {key: "xmageBottom", expectValue: "0"}],
    ["HwMnoteCloudEnhancementMode", {key: "isCloudEnhancement", expectValue: "default_exif_value"}],
    ["HwMnoteWindSnapshotMode", {key: "windSnapshotMode", expectValue: "default_exif_value"}],
    ["HwMnoteSceneVersion", {key: "sceneVersion", expectValue: "1207959808"}],
    ["HwMnoteSceneFoodConf", {key: "sceneFoodConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneStageConf", {key: "sceneStageConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneBlueSkyConf", {key: "sceneBlueSkyConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneGreenPlantConf", {key: "sceneGreenPlantConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneBeachConf", {key: "sceneBeachConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneSnowConf", {key: "sceneSnowConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneSunsetConf", {key: "sceneSunsetConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneFlowersConf", {key: "sceneFlowersConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneNightConf", {key: "sceneNightConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneTextConf", {key: "sceneTextConf", expectValue: "default_exif_value"}],
    ["HwMnoteFaceCount", {key: "faceCount", expectValue: "default_exif_value"}],
    ["HwMnoteFaceConf", {key: "faceConf", expectValue: "default_exif_value"}],
    ["HwMnoteFaceSmileScore", {key: "faceSmileScore", expectValue: "default_exif_value"}],
    ["HwMnoteCaptureMode", {key: "captureMode", expectValue: "0"}],
    ["HwMnoteBurstNumber", {key: "burstNumber", expectValue: "default_exif_value"}],
    ["HwMnoteFrontCamera", {key: "frontCamera", expectValue: "0"}],
    ["HwMnoteRollAngle", {key: "rollAngle", expectValue: "-3"}],
    ["HwMnotePitchAngle", {key: "pitchAngle", expectValue: "-72"}],
    ["HwMnotePhysicalAperture", {key: "physicalAperture", expectValue: "1"}],
    ["HwMnoteFocusMode", {key: "focusMode", expectValue: "default_exif_value"}],
])

// test_exif.jpg
const testExifExpectedValue = new Map<string, ModifyRule>([
    ["NewSubfileType", {key: "newSubfileType", expectValue: undefined}],
    ["SubfileType", {key: "subfileType", expectValue: undefined}],
    ["ImageWidth", {key: "imageWidth", expectValue: "6016"}],
    ["ImageLength", {key: "imageLength", expectValue: "3384"}],
    ["BitsPerSample", {key: "bitsPerSample", expectValue: undefined}],
    ["Compression", {key: "compression", expectValue: "JPEG compression"}],
    ["PhotometricInterpretation", {key: "photometricInterpretation", expectValue: undefined}],
    ["ImageDescription", {key: "imageDescription", expectValue: undefined}],
    ["StripOffsets", {key: "stripOffsets", expectValue: undefined}],
    ["Orientation", {key: "orientation", expectValue: "Top-left"}],
    ["SamplesPerPixel", {key: "samplesPerPixel", expectValue: undefined}],
    ["RowsPerStrip", {key: "rowsPerStrip", expectValue: undefined}],
    ["StripByteCounts", {key: "stripByteCounts", expectValue: undefined}],
    ["XResolution", {key: "xResolution", expectValue: "72"}],
    ["YResolution", {key: "yResolution", expectValue: "72"}],
    ["PlanarConfiguration", {key: "planarConfiguration", expectValue: undefined}],
    ["ResolutionUnit", {key: "resolutionUnit", expectValue: "Inch"}],
    ["TransferFunction", {key: "transferFunction", expectValue: undefined}],
    ["Software", {key: "software", expectValue: undefined}],
    ["DateTime", {key: "dateTime", expectValue: "2022:03:18 22:55:54"}],
    ["Artist", {key: "artist", expectValue: undefined}],
    ["WhitePoint", {key: "whitePoint", expectValue: undefined}],
    ["PrimaryChromaticities", {key: "primaryChromaticities", expectValue: undefined}],
    ["PhotoMode", {key: "photoMode", expectValue: undefined}],
    ["JPEGInterchangeFormat", {key: "jPEGInterchangeFormat", expectValue: "5770"}],
    ["JPEGInterchangeFormatLength", {key: "jPEGInterchangeFormatLength", expectValue: "13392"}],
    ["YCbCrCoefficients", {key: "yCbCrCoefficients", expectValue: undefined}],
    ["YCbCrSubSampling", {key: "yCbCrSubSampling", expectValue: undefined}],
    ["YCbCrPositioning", {key: "yCbCrPositioning", expectValue: "Centered"}],
    ["ReferenceBlackWhite", {key: "referenceBlackWhite", expectValue: undefined}],
    ["Copyright", {key: "copyright", expectValue: undefined}],
    ["ExposureTime", {key: "exposureTime", expectValue: "1/8 sec."}],
    ["FNumber", {key: "fNumber", expectValue: "f/1.85"}],
    ["ExposureProgram", {key: "exposureProgram", expectValue: "Not defined"}],
    ["SpectralSensitivity", {key: "spectralSensitivity", expectValue: undefined}],
    ["GPSVersionID", {key: "gPSVersionID", expectValue: undefined}],
    ["GPSLatitudeRef", {key: "gPSLatitudeRef", expectValue: "N"}],
    ["GPSLatitude", {key: "gPSLatitude", expectValue: "40,  3, 32.41"}],
    ["GPSLongitudeRef", {key: "gPSLongitudeRef", expectValue: "E"}],
    ["GPSLongitude", {key: "gPSLongitude", expectValue: "116, 10, 31.77"}],
    ["GPSAltitudeRef", {key: "gPSAltitudeRef", expectValue: "Sea level"}],
    ["GPSAltitude", {key: "gPSAltitude", expectValue: "61.021"}],
    ["GPSTimeStamp", {key: "gPSTimeStamp", expectValue: "14:55:57.00"}],
    ["GPSSatellites", {key: "gPSSatellites", expectValue: undefined}],
    ["GPSStatus", {key: "gPSStatus", expectValue: undefined}],
    ["GPSMeasureMode", {key: "gPSMeasureMode", expectValue: undefined}],
    ["GPSDOP", {key: "gPSDOP", expectValue: undefined}],
    ["GPSSpeedRef", {key: "gPSSpeedRef", expectValue: undefined}],
    ["GPSSpeed", {key: "gPSSpeed", expectValue: undefined}],
    ["GPSTrackRef", {key: "gPSTrackRef", expectValue: undefined}],
    ["GPSTrack", {key: "gPSTrack", expectValue: undefined}],
    ["GPSImgDirectionRef", {key: "gPSImgDirectionRef", expectValue: undefined}],
    ["GPSImgDirection", {key: "gPSImgDirection", expectValue: undefined}],
    ["GPSMapDatum", {key: "gPSMapDatum", expectValue: undefined}],
    ["GPSDestLatitudeRef", {key: "gPSDestLatitudeRef", expectValue: undefined}],
    ["GPSDestLatitude", {key: "gPSDestLatitude", expectValue: undefined}],
    ["GPSDestLongitudeRef", {key: "gPSDestLongitudeRef", expectValue: undefined}],
    ["GPSDestLongitude", {key: "gPSDestLongitude", expectValue: undefined}],
    ["GPSDestBearingRef", {key: "gPSDestBearingRef", expectValue: undefined}],
    ["GPSDestBearing", {key: "gPSDestBearing", expectValue: undefined}],
    ["GPSDestDistanceRef", {key: "gPSDestDistanceRef", expectValue: undefined}],
    ["GPSDestDistance", {key: "gPSDestDistance", expectValue: undefined}],
    ["GPSProcessingMethod", {key: "gPSProcessingMethod", expectValue: "GPS"}],
    ["GPSAreaInformation", {key: "gPSAreaInformation", expectValue: undefined}],
    ["GPSDateStamp", {key: "gPSDateStamp", expectValue: "2022:03:18"}],
    ["GPSDifferential", {key: "gPSDifferential", expectValue: undefined}],
    ["GPSHPositioningError", {key: "gPSHPositioningError", expectValue: undefined}],
    ["ISOSpeedRatings", {key: "iSOSpeedRatings", expectValue: "942"}],
    ["PhotographicSensitivity", {key: "photographicSensitivity", expectValue: "942"}],
    ["OECF", {key: "oECF", expectValue: undefined}],
    ["SensitivityType", {key: "sensitivityType", expectValue: undefined}],
    ["StandardOutputSensitivity", {key: "standardOutputSensitivity", expectValue: undefined}],
    ["RecommendedExposureIndex", {key: "recommendedExposureIndex", expectValue: undefined}],
    ["ISOSpeed", {key: "iSOSpeed", expectValue: undefined}],
    ["ISOSpeedLatitudeyyy", {key: "iSOSpeedLatitudeyyy", expectValue: undefined}],
    ["ISOSpeedLatitudezzz", {key: "iSOSpeedLatitudezzz", expectValue: undefined}],
    ["ExifVersion", {key: "exifVersion", expectValue: "Exif Version 2.2"}],
    ["DateTimeOriginal", {key: "dateTimeOriginal", expectValue: "2022:03:18 22:55:54"}],
    ["DateTimeDigitized", {key: "dateTimeDigitized", expectValue: "2022:03:18 22:55:54"}],
    ["OffsetTime", {key: "offsetTime", expectValue: "+08:00"}],
    ["OffsetTimeOriginal", {key: "offsetTimeOriginal", expectValue: "+08:00"}],
    ["OffsetTimeDigitized", {key: "offsetTimeDigitized", expectValue: undefined}],
    ["ComponentsConfiguration", {key: "componentsConfiguration", expectValue: "Y Cb Cr -"}],
    ["CompressedBitsPerPixel", {key: "compressedBitsPerPixel", expectValue: undefined}],
    ["ShutterSpeedValue", {key: "shutterSpeedValue", expectValue: "3.00 EV (1/8 sec.)"}],
    ["ApertureValue", {key: "apertureValue", expectValue: "1.77 EV (f/1.8)"}],
    ["BrightnessValue", {key: "brightnessValue", expectValue: "0.00 EV (3.43 cd/m^2)"}],
    ["ExposureBiasValue", {key: "exposureBiasValue", expectValue: "0.00 EV"}],
    ["MaxApertureValue", {key: "maxApertureValue", expectValue: "1.77 EV (f/1.8)"}],
    ["SubjectDistance", {key: "subjectDistance", expectValue: undefined}],
    ["MeteringMode", {key: "meteringMode", expectValue: "Center-weighted average"}],
    ["LightSource", {key: "lightSource", expectValue: "D65"}],
    ["Flash", {key: "flash", expectValue: "Flash did not fire, compulsory flash mode"}],
    ["FocalLength", {key: "focalLength", expectValue: "6.8 mm"}],
    ["SubjectArea", {key: "subjectArea", expectValue: undefined}],
    ["MakerNote", {key: "makerNote", expectValue: undefined}],
    ["UserComment", {key: "UserComment", expectValue: undefined}],
    ["SubsecTime", {key: "subsecTime", expectValue: "285"}],
    ["SubsecTimeOriginal", {key: "subsecTimeOriginal", expectValue: "285"}],
    ["SubsecTimeDigitized", {key: "subsecTimeDigitized", expectValue: "285"}],
    ["FlashpixVersion", {key: "flashpixVersion", expectValue: "FlashPix Version 1.0"}],
    ["ColorSpace", {key: "colorSpace", expectValue: "sRGB"}],
    ["PixelXDimension", {key: "pixelXDimension", expectValue: "256"}],
    ["PixelYDimension", {key: "pixelYDimension", expectValue: "144"}],
    ["RelatedSoundFile", {key: "relatedSoundFile", expectValue: undefined}],
    ["FlashEnergy", {key: "flashEnergy", expectValue: undefined}],
    ["SpatialFrequencyResponse", {key: "spatialFrequencyResponse", expectValue: undefined}],
    ["FocalPlaneXResolution", {key: "focalPlaneXResolution", expectValue: undefined}],
    ["FocalPlaneYResolution", {key: "focalPlaneYResolution", expectValue: undefined}],
    ["FocalPlaneResolutionUnit", {key: "focalPlaneResolutionUnit", expectValue: undefined}],
    ["SubjectLocation", {key: "subjectLocation", expectValue: undefined}],
    ["ExposureIndex", {key: "exposureIndex", expectValue: undefined}],
    ["SensingMethod", {key: "sensingMethod", expectValue: "Unknown value 0"}],
    ["FileSource", {key: "fileSource", expectValue: undefined}],
    ["SceneType", {key: "sceneType", expectValue: null}],
    ["CFAPattern", {key: "cFAPattern", expectValue: undefined}],
    ["CustomRendered", {key: "customRendered", expectValue: undefined}],
    ["ExposureMode", {key: "exposureMode", expectValue: "Auto exposure"}],
    ["WhiteBalance", {key: "whiteBalance", expectValue: "Auto white balance"}],
    ["DigitalZoomRatio", {key: "digitalZoomRatio", expectValue: undefined}],
    ["FocalLengthIn35mmFilm", {key: "focalLengthIn35mmFilm", expectValue: "0"}],
    ["SceneCaptureType", {key: "sceneCaptureType", expectValue: "Standard"}],
    ["GainControl", {key: "gainControl", expectValue: undefined}],
    ["Contrast", {key: "contrast", expectValue: undefined}],
    ["Saturation", {key: "saturation", expectValue: undefined}],
    ["Sharpness", {key: "sharpness", expectValue: undefined}],
    ["DeviceSettingDescription", {key: "deviceSettingDescription", expectValue: undefined}],
    ["SubjectDistanceRange", {key: "subjectDistanceRange", expectValue: undefined}],
    ["ImageUniqueID", {key: "imageUniqueID", expectValue: undefined}],
    ["CameraOwnerName", {key: "cameraOwnerName", expectValue: undefined}],
    ["BodySerialNumber", {key: "bodySerialNumber", expectValue: undefined}],
    ["LensSpecification", {key: "lensSpecification", expectValue: undefined}],
    ["LensMake", {key: "lensMake", expectValue: undefined}],
    ["LensModel", {key: "lensModel", expectValue: undefined}],
    ["LensSerialNumber", {key: "lensSerialNumber", expectValue: undefined}],
    ["CompositeImage", {key: "compositeImage", expectValue: undefined}],
    ["SourceImageNumberOfCompositeImage", {key: "sourceImageNumberOfCompositeImage", expectValue: undefined}],
    ["SourceExposureTimesOfCompositeImage", {key: "sourceExposureTimesOfCompositeImage", expectValue: undefined}],
    ["Gamma", {key: "gamma", expectValue: undefined}],
    ["DNGVersion", {key: "dNGVersion", expectValue: undefined}],
    ["DefaultCropSize", {key: "defaultCropSize", expectValue: undefined}],
    ["GIFLoopCount", {key: "gIFLoopCount", expectValue: undefined}],
    ["HwMnoteIsXmageSupported", {key: "isXmageSupported", expectValue: "default_exif_value"}],
    ["HwMnoteXmageMode", {key: "xmageWatermarkMode", expectValue: "default_exif_value"}],
    ["HwMnoteXmageLeft", {key: "xmageLeft", expectValue: "default_exif_value"}],
    ["HwMnoteXmageTop", {key: "xmageTop", expectValue: "default_exif_value"}],
    ["HwMnoteXmageRight", {key: "xmageRight", expectValue: "default_exif_value"}],
    ["HwMnoteXmageBottom", {key: "xmageBottom", expectValue: "default_exif_value"}],
    ["HwMnoteCloudEnhancementMode", {key: "isCloudEnhancement", expectValue: "default_exif_value"}],
    ["HwMnoteWindSnapshotMode", {key: "windSnapshotMode", expectValue: "default_exif_value"}],
    ["HwMnoteSceneVersion", {key: "sceneVersion", expectValue: "default_exif_value"}],
    ["HwMnoteSceneFoodConf", {key: "sceneFoodConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneStageConf", {key: "sceneStageConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneBlueSkyConf", {key: "sceneBlueSkyConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneGreenPlantConf", {key: "sceneGreenPlantConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneBeachConf", {key: "sceneBeachConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneSnowConf", {key: "sceneSnowConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneSunsetConf", {key: "sceneSunsetConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneFlowersConf", {key: "sceneFlowersConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneNightConf", {key: "sceneNightConf", expectValue: "default_exif_value"}],
    ["HwMnoteSceneTextConf", {key: "sceneTextConf", expectValue: "default_exif_value"}],
    ["HwMnoteFaceCount", {key: "faceCount", expectValue: "default_exif_value"}],
    ["HwMnoteFaceConf", {key: "faceConf", expectValue: "default_exif_value"}],
    ["HwMnoteFaceSmileScore", {key: "faceSmileScore", expectValue: "default_exif_value"}],
    ["HwMnoteCaptureMode", {key: "captureMode", expectValue: "default_exif_value"}],
    ["HwMnoteBurstNumber", {key: "burstNumber", expectValue: "default_exif_value"}],
    ["HwMnoteFrontCamera", {key: "frontCamera", expectValue: "default_exif_value"}],
    ["HwMnoteRollAngle", {key: "rollAngle", expectValue: "default_exif_value"}],
    ["HwMnotePitchAngle", {key: "pitchAngle", expectValue: "default_exif_value"}],
    ["HwMnotePhysicalAperture", {key: "physicalAperture", expectValue: "default_exif_value"}],
    ["HwMnoteFocusMode", {key: "focusMode", expectValue: "default_exif_value"}],
])


async function verifyExifPropertiesByMetadata(
    metadata: image.Metadata | image.ExifMetadata | image.MakerNoteHuaweiMetadata,
    keys: Array<image.PropertyKey> | null,
    expectedMap: Map<string, ModifyRule>,
    imageName?: string,
    method?:string
): Promise<boolean> {
    let result: boolean = true;
    const allProperties: Record<string, string | null> = await metadata.getAllProperties();

    console.log(`allProperties: ${allProperties}`)

    let keyArray: Array<string> = keys ?? new Array<string>();

    for (let i: number = 0; i < keyArray.length; i++){
        let key = keyArray[i];
        const rule: ModifyRule | undefined = expectedMap.get(key);
        if(rule === undefined) {
            result = result && false;
            continue;
        }
        const actualValue: string | null = allProperties[key];
        hilog.info(0x0000, 'testTag', `expect key: ${rule.key}, actualValue: ${actualValue}, expectValue: ${rule.expectValue}`)
        result = result && (actualValue === rule.expectValue);
        hilog.info(0x0000, 'testTag', `${imageName} ${key} ${method} expect RESULT: ${actualValue === rule.expectValue}`)
    }
    console.log(`expect all result: ${result}`)
    return result;
}

async function verifyExifPropertiesByMetadata1(
    metadata: image.Metadata | image.ExifMetadata | image.MakerNoteHuaweiMetadata,
    keys: image.PropertyKey[] | null,
    expectedRecord: Record<image.PropertyKey, string | null>,
    imageName?: string,
    method?:string
): Promise<boolean> {
    let result: boolean = true;
    const allProperties: Record<string, string | null> = await metadata.getAllProperties();

    console.log(`allProperties: ${allProperties}`)

    let keyArray: image.PropertyKey[] = keys ?? []
    for (let i: number = 0; i < keyArray.length; i++){
        let key = keyArray[i];
        const expectValue: string | undefined | null = expectedRecord[key];
        const actualValue: string | undefined | null = allProperties[key];
        hilog.info(0x0000, 'testTag', `expect key: ${key}, actualValue: ${actualValue}, expectValue: ${expectValue}`)
        result = result && (actualValue === expectValue);
        hilog.info(0x0000, 'testTag', `${imageName} ${key} ${method} expect RESULT: ${actualValue === expectValue}`)
    }

    console.log(`result: ${result}`)
    return result;
}

async function convert(
    setkey: Map<image.PropertyKey, string | null>
): Promise<Record<image.PropertyKey, string | null>> {
    let record: Record<string, string | null> = {};
    setkey.forEach((value, key) => {
        record[key] = value;
    });
    return record as Record<image.PropertyKey, string | null>;
}

export{
    allPropertyKeys,
    exifKeys,
    makerNoteKeys,
    CUVAHdrExpectedValue,
    CUVAHdrMultiExpectedValue,
    testExifExpectedValue,
    verifyExifPropertiesByMetadata,
    verifyExifPropertiesByMetadata1,
    convert
};


