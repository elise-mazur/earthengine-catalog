local id = 'LANDSAT/LT05/C01/T1_SR';
local subdir = 'LANDSAT';
local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';
local license = spdx.proprietary;
local versions = import 'versions.libsonnet';
local version_table = import 'LT5_T1_L2_versions.libsonnet';
local version_config = versions(subdir, version_table, id);
local version = version_config.version;
{
  "gee:skip_indexing": true,
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'USGS Landsat 5 Surface Reflectance Tier 1 [deprecated]',
  deprecated: true,
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    This dataset is the atmospherically
    corrected surface reflectance from the Landsat 5 ETM sensor.
    These images contain 4 visible and near-infrared (VNIR) bands and 2 short-wave
    infrared (SWIR) bands processed to orthorectified surface reflectance,
    and one thermal infrared (TIR) band processed to orthorectified brightness
    temperature.  The VNIR and SWIR bands have a resolution of 30m / pixel.
    The TIR band, while originally collected with a resolution of 120m / pixel
    (60m / pixel for Landsat 7) has been resampled using cubic convolution to 30m.

    These data have been atmospherically corrected using
    [LEDAPS](https://www.usgs.gov/media/files/landsat-4-7-surface-reflectance-code-ledaps-product-guide),
    and include a cloud, shadow, water and snow mask produced using
    [CFMASK](https://www.usgs.gov/land-resources/nli/landsat/cfmask-algorithm),
    as well as a per-pixel saturation mask.

    Strips of collected data are packaged into overlapping \"scenes\" covering approximately
    170km x 183km using a [standardized reference grid](https://www.usgs.gov/faqs/what-worldwide-reference-system-wrs).

    Note that
    [Landsat 7's orbit has been drifting to an earlier acquisition time since 2017](https://www.sciencedirect.com/science/article/pii/S2666017221000134?via%3Dihub).

    See also [the USGS page on SR QA bands](https://www.usgs.gov/land-resources/nli/landsat/landsat-surface-reflectance-quality-assessment).

    SR can only be produced for Landsat assets processed to the
    [L1TP level](https://www.usgs.gov/land-resources/nli/landsat/landsat-levels-processing)

    Data provider notes:
    <ul>
      <li>SR is not run for a scene with a solar zenith angle greater than 76&deg;.</li>
      <li>Users are cautioned to avoid using SR for data acquired
      over high latitudes (&gt; 65&deg;).</li>
      <li>The panchromatic band (ETM+ Band 7, OLI Band 8) is not processed to
      Surface Reflectance.</li>
      <li>Efficacy of SR correction will be likely reduced in areas
      where atmospheric correction is affected by adverse conditions:
        <ul>
          <li>Hyper-arid or snow-covered regions</li>
          <li>Low sun angle conditions</li>
          <li>Coastal regions where land area is small relative to adjacent water</li>
          <li>Areas with extensive cloud contamination</li>
        </ul>
      </li>
    </ul>

    This product is generated by Google using a Docker image supplied by USGS.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + version_config.version_links,
  keywords: [
    'cfmask',
    'cloud',
    'fmask',
    'global',
    'landsat',
    'ledaps',
    'lt05',
    'reflectance',
    'sr',
    'usgs',
  ],
  providers: [
    ee.producer_provider('USGS', 'https://www.usgs.gov/core-science-systems/nli/landsat/landsat-surface-reflectance'),
    ee.host_provider(version_config.ee_catalog_url),
  ],
  extent: ee.extent_global('1984-03-16T16:20:00Z', '2012-05-05T17:54:06Z'),
  summaries: {
    'gee:schema': [
      {
        name: 'CLOUD_COVER',
        description: 'Percentage cloud cover (0-100), -1 = not calculated.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.double,
      },
      {
        name: 'CLOUD_COVER_LAND',
        description: 'Percentage cloud cover over land (0-100), -1 = not calculated.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.double,
      },
      {
        name: 'EARTH_SUN_DISTANCE',
        description: 'Earth-Sun distance (AU)',
        type: ee_const.var_type.double,
      },
      {
        name: 'ESPA_VERSION',
        description: 'Internal ESPA image version used to compute SR',
        type: ee_const.var_type.string,
      },
      {
        name: 'GEOMETRIC_RMSE_MODEL',
        description: |||
          Combined RMSE (Root Mean Square Error) of the geometric
              residuals (meters) in both across-track and along-track
              directions. (Obtained from raw Landsat metadata)
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'GEOMETRIC_RMSE_MODEL_X',
        description: |||
          RMSE (Root Mean Square Error) of the geometric residuals (meters)
              measured on the GCPs (Ground Control Points) used in geometric
              precision correction in the along-track direction.
              (Obtained from raw Landsat metadata)
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'GEOMETRIC_RMSE_MODEL_Y',
        description: |||
          RMSE (Root Mean Square Error) of the geometric residuals (meters)
              measured on the GCPs (Ground Control Points) used in geometric
              precision correction in the across-track direction.
              (Obtained from raw Landsat metadata)
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'IMAGE_QUALITY',
        description: 'Image quality, 0 = worst, 9 = best, -1 = quality not calculated.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.int,
      },
      {
        name: 'LANDSAT_ID',
        description: 'Landsat Product Identifier (Collection 1)',
        type: ee_const.var_type.string,
      },
      {
        name: 'LEVEL1_PRODUCTION_DATE',
        description: 'Date of production for raw Level 1 data as ms since epoch',
        type: ee_const.var_type.int,
      },
      {
        name: 'PIXEL_QA_VERSION',
        description: "Version of the software used to produce the 'pixel_qa' band",
        type: ee_const.var_type.string,
      },
      {
        name: 'SATELLITE',
        description: 'Name of satellite',
        type: ee_const.var_type.string,
      },
      {
        name: 'SENSING_TIME',
        description: 'Time of the observations as in ISO 8601 string.\n(Obtained from raw Landsat metadata)',
        type: ee_const.var_type.string,
      },
      {
        name: 'SOLAR_AZIMUTH_ANGLE',
        description: 'Solar azimuth angle',
        type: ee_const.var_type.double,
      },
      {
        name: 'SR_APP_VERSION',
        description: 'LEDAPS version used to process surface reflectance',
        type: ee_const.var_type.string,
      },
      {
        name: 'WRS_PATH',
        description: 'WRS path number of scene',
        type: ee_const.var_type.int,
      },
      {
        name: 'WRS_ROW',
        description: 'WRS row number of scene',
        type: ee_const.var_type.int,
      },
    ],
    gsd: [
      30.0,
    ],
    'eo:bands': [
      {
        name: 'B1',
        description: 'Band 1 (blue) surface reflectance',
        center_wavelength: 0.485,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.45-0.52 &mu;m',
      },
      {
        name: 'B2',
        description: 'Band 2 (green) surface reflectance',
        center_wavelength: 0.56,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.52-0.60 &mu;m',
      },
      {
        name: 'B3',
        description: 'Band 3 (red) surface reflectance',
        center_wavelength: 0.66,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.63-0.69 &mu;m',
      },
      {
        name: 'B4',
        description: 'Band 4 (near infrared) surface reflectance',
        center_wavelength: 0.835,
        'gee:scale': 0.0001,
        'gee:wavelength': '0.77-0.90 &mu;m',
      },
      {
        name: 'B5',
        description: 'Band 5 (shortwave infrared 1) surface reflectance',
        center_wavelength: 1.65,
        'gee:scale': 0.0001,
        'gee:wavelength': '1.55-1.75 &mu;m',
      },
      {
        name: 'B6',
        description: |||
          Band 6 brightness temperature. While originally collected with a
          resolution of 120m / pixel (60m / pixel for Landsat 7), this band has
          been resampled using cubic convolution to 30m.
        |||,
        'gee:units': units.kelvin,
        center_wavelength: 11.45,
        'gee:scale': 0.1,
        'gee:wavelength': '10.40-12.50 &mu;m',
      },
      {
        name: 'B7',
        description: 'Band 7 (shortwave infrared 2) surface reflectance',
        center_wavelength: 2.215,
        'gee:scale': 0.0001,
        'gee:wavelength': '2.08-2.35 &mu;m',
      },
      {
        name: 'sr_atmos_opacity',
        description: 'Atmospheric opacity; < 0.1 = clear; 0.1 - 0.3 = average; > 0.3 = hazy',
        'gee:scale': 0.001,
      },
      {
        name: 'sr_cloud_qa',
        description: |||
          Cloud quality attributes. Note: pixel_qa is likely to present more accurate results
          than sr_cloud_qa for cloud masking. See page 14 in
          the [LEDAPS product guide](https://www.usgs.gov/media/files/landsat-4-7-surface-reflectance-code-ledaps-product-guide).
        |||,
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'Dark Dense Vegetation (DDV)',
              bit_count: 1,
              first_bit: 0,
            },
            {
              description: 'Cloud',
              first_bit: 1,
              bit_count: 1,
            },
            {
              description: 'Cloud shadow',
              first_bit: 2,
              bit_count: 1,
            },
            {
              description: 'Adjacent to cloud',
              first_bit: 3,
              bit_count: 1,
            },
            {
              description: 'Snow',
              first_bit: 4,
              bit_count: 1,
            },
            {
              description: 'Water',
              first_bit: 5,
              bit_count: 1,
            },
          ],
          total_bit_count: 6,
        },
      },
      {
        name: 'pixel_qa',
        description: 'Pixel quality attributes generated from the CFMASK algorithm.',
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'Fill',
              bit_count: 1,
              first_bit: 0,
            },
            {
              description: 'Clear',
              first_bit: 1,
              bit_count: 1,
            },
            {
              description: 'Water',
              first_bit: 2,
              bit_count: 1,
            },
            {
              description: 'Cloud Shadow',
              first_bit: 3,
              bit_count: 1,
            },
            {
              description: 'Snow',
              first_bit: 4,
              bit_count: 1,
            },
            {
              description: 'Cloud',
              first_bit: 5,
              bit_count: 1,
            },
            {
              description: 'Cloud Confidence',
              first_bit: 6,
              bit_count: 2,
              values: [
                {
                  description: 'None',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low',
                },
                {
                  value: 2,
                  description: 'Medium',
                },
                {
                  value: 3,
                  description: 'High',
                },
              ],
            },
          ],
          total_bit_count: 8,
        },
      },
      {
        name: 'radsat_qa',
        description: 'Radiometric saturation QA',
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'Data Fill Flag',
              bit_count: 1,
              values: [
                {
                  description: 'Valid data',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Invalid data',
                },
              ],
              first_bit: 0,
            },
            {
              description: 'Band 1 data saturated',
              first_bit: 1,
              bit_count: 1,
            },
            {
              description: 'Band 2 data saturated',
              first_bit: 2,
              bit_count: 1,
            },
            {
              description: 'Band 3 data saturated',
              first_bit: 3,
              bit_count: 1,
            },
            {
              description: 'Band 4 data saturated',
              first_bit: 4,
              bit_count: 1,
            },
            {
              description: 'Band 5 data saturated',
              first_bit: 5,
              bit_count: 1,
            },
            {
              description: 'Band 6 data saturated',
              first_bit: 6,
              bit_count: 1,
            },
            {
              description: 'Band 7 data saturated',
              first_bit: 7,
              bit_count: 1,
            },
          ],
          total_bit_count: 8,
        },
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'True Color (321)',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            gain: [
              1.4,
              1.2,
              1.0,
            ],
            bands: [
              'B3',
              'B2',
              'B1',
            ],
          },
        },
      },
      {
        display_name: 'Near Infrared (432)',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            gain: [
              1.4,
              1.2,
              1.4,
            ],
            bands: [
              'B4',
              'B3',
              'B2',
            ],
          },
        },
      },
      {
        display_name: 'Shortwave Infrared (742)',
        lookat: {
          lon: 6.746,
          lat: 46.529,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            gain: [
              1.8,
              1.9,
              1.9,
            ],
            bands: [
              'B7',
              'B4',
              'B2',
            ],
          },
        },
      },
    ],
  },
  'gee:interval': {
    type: 'revisit_interval',
    unit: 'day',
    interval: 16,
  },
  'gee:terms_of_use': importstr 'terms_of_use.md',
  version: version,
}
