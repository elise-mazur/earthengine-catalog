local id = 'LANDSAT/LM04/C01/T1';
local subdir = 'LANDSAT';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local landsat = import 'landsat.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.pddl_1_0;
local template = import 'templates/LM05_C01.libsonnet';

local versions = import 'versions.libsonnet';
local version_table = import 'LM4_T1_versions.libsonnet';
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
  title: 'USGS Landsat 4 MSS Collection 1 Tier 1 Raw Scenes [deprecated]',
  version: version,
  deprecated: true,
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    Landsat 4 MSS Collection 1 Tier 1 DN values, representing scaled, calibrated at-sensor radiance.
  ||| + landsat.tier1,
  license: license.id,
  links: ee.standardLinks(subdir, id) + version_config.version_links,
  keywords: [
    'c1',
    'global',
    'l4',
    'landsat',
    'lm4',
    'mss',
    'radiance',
    't1',
    'tier1',
    'usgs',
  ],
  providers: [
    ee.producer_provider('USGS', 'https://www.usgs.gov/core-science-systems/nli/landsat/landsat-1-5-multispectral-scanner-collection-1'),
    ee.host_provider(version_config.ee_catalog_url),
  ],
  extent: ee.extent_global('1982-08-14T18:22:17Z', '1992-08-28T07:14:35Z'),
  summaries: template.summaries,
  'gee:interval': {
    type: 'revisit_interval',
    unit: 'day',
    interval: 16,
  },
  'gee:terms_of_use': importstr 'terms_of_use.md',
}
