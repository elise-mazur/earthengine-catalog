local id = 'LANDSAT/LC08/C01/T1_ANNUAL_GREENEST_TOA';
local subdir = 'LANDSAT';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
  ],
  id: id,
  title: 'Landsat 8 Collection 1 Tier 1 Landsat 8 Collection 1 Tier 1 Annual Greenest-Pixel TOA Reflectance Composite',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    Landsat 8 Collection 1 Tier 1
      calibrated top-of-atmosphere (TOA) reflectance.
      Calibration coefficients are extracted from the image metadata.
      See [Chander et al. (2009)](https://www.sciencedirect.com/science/article/pii/S0034425709000169)
      for details on the TOA computation.

    These composites are created from
    all the scenes in
    each annual period beginning from the first day of the year and
    continuing to the last day of the year.  All the images from each year
    are included in the composite, with the greenest pixel as the composite value, where
    the greenest pixel means the pixel with the highest value of
    the Normalized Difference Vegetation Index (NDVI).
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'greenest',
    'landsat',
    'toa',
    'usgs',
  ],
  providers: [
    ee.producer_provider('Google', 'https://earthengine.google.com/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('2013-01-01T00:00:00Z', null),
  summaries: {
    'eo:bands': [
      {
        name: 'B1',
        description: 'Coastal aerosol',
        center_wavelength: 0.44,
        gsd: 30.0,
        'gee:wavelength': '0.43 - 0.45 &mu;m',
      },
      {
        name: 'B2',
        description: 'Blue',
        center_wavelength: 0.48,
        gsd: 30.0,
        'gee:wavelength': '0.45 - 0.51 &mu;m',
      },
      {
        name: 'B3',
        description: 'Green',
        center_wavelength: 0.56,
        gsd: 30.0,
        'gee:wavelength': '0.53 - 0.59 &mu;m',
      },
      {
        name: 'B4',
        description: 'Red',
        center_wavelength: 0.655,
        gsd: 30.0,
        'gee:wavelength': '0.64 - 0.67 &mu;m',
      },
      {
        name: 'B5',
        description: 'Near infrared',
        center_wavelength: 0.865,
        gsd: 30.0,
        'gee:wavelength': '0.85 - 0.88 &mu;m',
      },
      {
        name: 'B6',
        description: 'Shortwave infrared 1',
        center_wavelength: 1.61,
        gsd: 30.0,
        'gee:wavelength': '1.57 - 1.65 &mu;m',
      },
      {
        name: 'B7',
        description: 'Shortwave infrared 2',
        center_wavelength: 2.2,
        gsd: 30.0,
        'gee:wavelength': '2.11 - 2.29 &mu;m',
      },
      {
        name: 'B8',
        description: 'Band 8 Panchromatic',
        center_wavelength: 0.71,
        gsd: 15.0,
        'gee:wavelength': '0.52 - 0.90 &mu;m',
      },
      {
        name: 'B9',
        description: 'Cirrus',
        center_wavelength: 1.37,
        gsd: 15.0,
        'gee:wavelength': '1.36 - 1.38 &mu;m',
      },
      {
        name: 'B10',
        description: 'Thermal infrared 1, resampled from 100m to 30m',
        center_wavelength: 10.895,
        gsd: 30.0,
        'gee:wavelength': '10.60 - 11.19 &mu;m',
      },
      {
        name: 'B11',
        description: 'Thermal infrared 2, resampled from 100m to 30m',
        center_wavelength: 12.005,
        gsd: 30.0,
        'gee:wavelength': '11.50 - 12.51 &mu;m',
      },
      {
        name: 'BQA',
        description: |||
          Landsat Collection 1 QA Bitmask ([See Landsat QA page](https://www.usgs.gov/land-resources/nli/landsat/landsat-collection-1-level-1-quality-assessment-band))
        |||,
        gsd: 30.0,
        'gee:bitmask': {
          bitmask_parts: [
            {
              description: 'Designated Fill',
              bit_count: 1,
              values: [
                {
                  description: 'No',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Yes',
                },
              ],
              first_bit: 0,
            },
            {
              description: 'Terrain Occlusion',
              first_bit: 1,
              bit_count: 1,
              values: [
                {
                  description: 'No',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Yes',
                },
              ],
            },
            {
              description: 'Radiometric Saturation',
              first_bit: 2,
              bit_count: 2,
              values: [
                {
                  description: 'No bands contain saturation',
                  value: 0,
                },
                {
                  value: 1,
                  description: '1-2 bands contain saturation',
                },
                {
                  value: 2,
                  description: '3-4 bands contain saturation',
                },
                {
                  value: 3,
                  description: '5 or more bands contain saturation',
                },
              ],
            },
            {
              description: 'Cloud',
              first_bit: 4,
              bit_count: 1,
              values: [
                {
                  description: 'No',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Yes',
                },
              ],
            },
            {
              description: 'Cloud Confidence',
              first_bit: 5,
              bit_count: 2,
              values: [
                {
                  description: 'Not Determined / Condition does not exist.',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low, (0-33 percent confidence)',
                },
                {
                  value: 2,
                  description: 'Medium, (34-66 percent confidence)',
                },
                {
                  value: 3,
                  description: 'High, (67-100 percent confidence)',
                },
              ],
            },
            {
              description: 'Cloud Shadow Confidence',
              first_bit: 7,
              bit_count: 2,
              values: [
                {
                  description: 'Not Determined / Condition does not exist.',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low, (0-33 percent confidence)',
                },
                {
                  value: 2,
                  description: 'Medium, (34-66 percent confidence)',
                },
                {
                  value: 3,
                  description: 'High, (67-100 percent confidence)',
                },
              ],
            },
            {
              description: 'Snow / Ice Confidence',
              first_bit: 9,
              bit_count: 2,
              values: [
                {
                  description: 'Not Determined / Condition does not exist.',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low, (0-33 percent confidence)',
                },
                {
                  value: 2,
                  description: 'Medium, (34-66 percent confidence)',
                },
                {
                  value: 3,
                  description: 'High, (67-100 percent confidence)',
                },
              ],
            },
            {
              description: 'Cirrus Confidence',
              first_bit: 11,
              bit_count: 2,
              values: [
                {
                  description: 'Not Determined / Condition does not exist.',
                  value: 0,
                },
                {
                  value: 1,
                  description: 'Low, (0-33 percent confidence)',
                },
                {
                  value: 2,
                  description: 'Medium, (34-66 percent confidence)',
                },
                {
                  value: 3,
                  description: 'High, (67-100 percent confidence)',
                },
              ],
            },
          ],
          total_bit_count: 13,
        },
      },
      {
        name: 'greenness',
        description: |||
          The pixel with the highest value of the Normalized Difference Vegetation Index (NDVI) for the year covered by the image.
        |||,
        gsd: 30.0,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'True Color (432)',
        image_visualization: {
          band_vis: {
            gain: [
              500.0,
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
        display_name: 'Near Infrared (543)',
        image_visualization: {
          band_vis: {
            gain: [
              500.0,
            ],
            bands: [
              'B5',
              'B4',
              'B3',
            ],
          },
        },
      },
      {
        display_name: 'Shortwave Infrared (753)',
        image_visualization: {
          band_vis: {
            gain: [
              500.0,
            ],
            bands: [
              'B7',
              'B5',
              'B3',
            ],
          },
        },
      },
    ],
  },
  'gee:min_zoom_level': 5,
  'gee:interval': {type: 'cadence', unit: 'year', interval: 1},
  'gee:terms_of_use': importstr 'terms_of_use.md',
  'gee:is_derived': true,
}
