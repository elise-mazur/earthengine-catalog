local id = 'CSP/ERGo/1_0/US/lithology';
local subdir = 'CSP';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc_by_nc_sa_4_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'US Lithology',
  version: '1.0',
  'gee:type': ee_const.gee_type.image,
  description: |||
    The Lithology dataset provides classes of the general types of parent
    material of soil on the surface. It is not derived from any DEM.

    The Conservation Science Partners (CSP) Ecologically Relevant Geomorphology
    (ERGo) Datasets, Landforms and Physiography contain detailed, multi-scale
    data on landforms and physiographic (aka land facet) patterns. Although
    there are many potential uses of these data, the original purpose for these
    data was to develop an ecologically relevant classification and map of
    landforms and physiographic classes that are suitable for climate adaptation
    planning. Because there is large uncertainty associated with future climate
    conditions and even more uncertainty around ecological responses, providing
    information about what is unlikely to change offers a strong foundation for
    managers to build robust climate adaptation plans. The quantification of
    these features of the landscape is sensitive to the resolution, so we
    provide the highest resolution possible given the extent and characteristics
    of a given index.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'aspect',
    'csp',
    'elevation',
    'ergo',
    'geophysical',
    'landforms',
    'slope',
    'topography',
    'us',
  ],
  providers: [
    ee.producer_provider('Conservation Science Partners', 'https://www.csp-inc.org/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-132.09, 12.54, -60.35, 56.21,
                    '2006-01-24T00:00:00Z', '2011-05-13T00:00:00Z'),
  summaries: {
    gsd: [
      90.0,
    ],
    'eo:bands': [
      {
        name: 'b1',
        description: 'Lithology classes',
        'gee:classes': [
          {
            color: '356EFF',
            description: 'Water',
            value: 0,
          },
          {
            value: 1,
            color: 'ACB6DA',
            description: 'Carbonate',
          },
          {
            value: 3,
            color: 'D6B879',
            description: 'Non-carbonate',
          },
          {
            value: 4,
            color: '313131',
            description: 'Alkaline intrusive',
          },
          {
            value: 5,
            color: 'EDA800',
            description: 'Silicic residual',
          },
          {
            value: 7,
            color: '616161',
            description: 'Extrusive volcanic',
          },
          {
            value: 8,
            color: 'D6D6D6',
            description: 'Colluvial sediment',
          },
          {
            value: 9,
            color: 'D0DDAE',
            description: 'Glacial till clay',
          },
          {
            value: 10,
            color: 'B8D279',
            description: 'Glacial till loam',
          },
          {
            value: 11,
            color: 'D5D378',
            description: 'Glacial till coarse',
          },
          {
            value: 13,
            color: '141414',
            description: 'Glacial lake sediment fine',
          },
          {
            value: 14,
            color: '6DB155',
            description: 'Glacial outwash coarse',
          },
          {
            value: 15,
            color: '9B6D55',
            description: 'Hydric',
          },
          {
            value: 16,
            color: 'FEEEC9',
            description: 'Eolian sediment coarse',
          },
          {
            value: 17,
            color: 'D6B879',
            description: 'Eolian sediment fine',
          },
          {
            value: 18,
            color: '00B7EC',
            description: 'Saline lake sediment',
          },
          {
            value: 19,
            color: 'FFDA90',
            description: 'Alluvium and coastal sediment fine',
          },
          {
            value: 20,
            color: 'F8B28C',
            description: 'Coastal sediment coarse',
          },
        ],
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Lithology',
        lookat: {
          lat: 40.3439,
          lon: -105.8636,
          zoom: 11,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              20.0,
            ],
            palette: [
              '356EFF',
              'ACB6DA',
              'D6B879',
              '313131',
              'EDA800',
              '616161',
              'D6D6D6',
              'D0DDAE',
              'B8D279',
              'D5D378',
              '141414',
              '6DB155',
              '9B6D55',
              'FEEEC9',
              'D6B879',
              '00B7EC',
              'FFDA90',
              'F8B28C',
            ],
            bands: [
              'b1',
            ],
          },
        },
      },
    ],
  },
  'sci:citation': |||
    Theobald, D. M., Harrison-Atlas, D., Monahan, W. B., & Albano, C. M.
    (2015). Ecologically-relevant maps of landforms and physiographic diversity
    for climate adaptation planning. PloS one, 10(12),
    [e0143619](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0143619)
  |||,
  'gee:terms_of_use': ee.gee_terms_of_use(license),
  'gee:unusual_terms_of_use': true,
  'gee:user_uploaded': true,
}
