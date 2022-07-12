local id = 'NASA_USDA/HSL/soil_moisture';
local successor_id = 'NASA_USDA/HSL/SMAP10KM_soil_moisture';
local subdir = 'NASA_USDA';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local successor_basename = std.strReplace(successor_id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'NASA-USDA Global Soil Moisture Data [deprecated]',
  deprecated: true,
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The NASA-USDA Global soil moisture and the NASA-USDA SMAP Global soil
    moisture dataset provide soil moisture information across the globe at
    0.25°x0.25° spatial resolution. These datasets include
    [surface](ftp://gimms.gsfc.nasa.gov/SMOS/SMAP/Surface_Soil_Moisture_SMAP.pdf)
    and [subsurface](ftp://gimms.gsfc.nasa.gov/SMOS/SMAP/Sub_SurfaceSoil_Moisture_SMAP.pdf)
    soil moisture (mm),
    [soil moisture profile](ftp://gimms.gsfc.nasa.gov/SMOS/SMAP/SoilMoisture_Profile_SMAP.pdf) (%),
    and surface and subsurface soil moisture anomalies. Soil moisture anomalies
    are unitless and represent standardized
    anomalies computed using a 31-days moving window. Values around 0
    indicate typical moisture conditions, while very positive and very
    negative values indicate extreme wetting (soil moisture conditions are
    above average) and drying (soil moisture conditions are below average),
    respectively.

    This dataset is generated by integrating
    satellite-derived Soil Moisture Ocean Salinity (SMOS) Level 2 soil moisture
    observations into the modified two-layer Palmer model using a 1-D Ensemble
    Kalman Filter (EnKF) data assimilation approach. The assimilation of the
    SMOS soil moisture observations helped improve the model-based soil
    moisture predictions particularly over poorly instrumented areas
    (e.g., Southern African, Middle East) of the world that lack good quality
    precipitation data.

    This dataset was developed by the Hydrological Science Laboratory (HSL) at
    NASA’s Goddard Space Flight Center in cooperation with USDA Foreign
    Agricultural Services and USDA Hydrology and Remote Sensing Lab.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.successor(
        successor_id, catalog_subdir_url + successor_basename + '.json'),
  ],
  keywords: [
    'geophysical',
    'hsl',
    'moisture',
    'nasa',
    'smos',
    'soil',
    'usda',
  ],
  providers: [
    ee.producer_provider('NASA GSFC', 'https://gimms.gsfc.nasa.gov/SMOS/jbolten/FAS/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-180.0, -60.0, 180.0, 90.0, '2010-01-13T12:00:00Z', null),
  summaries: {
    gsd: [
      27830.0,
    ],
    'eo:bands': [
      {
        name: 'ssm',
        description: 'Surface soil moisture',
        'gee:units': 'mm',
      },
      {
        name: 'susm',
        description: 'Subsurface soil moisture',
        'gee:units': 'mm',
      },
      {
        name: 'smp',
        description: 'Soil moisture profile',
        'gee:units': 'fraction',
      },
      {
        name: 'ssma',
        description: 'Surface soil moisture anomaly',
        'gee:units': '-',
      },
      {
        name: 'susma',
        description: 'Subsurface soil moisture anomaly',
        'gee:units': '-',
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Soil Moisture',
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              28.0,
            ],
            palette: [
              '0300ff',
              '418504',
              'efff07',
              'efff07',
              'ff0303',
            ],
            bands: [
              'ssm',
            ],
          },
        },
      },
    ],
    ssm: {
      minimum: 0.0,
      maximum: 25.39,
      'gee:estimated_range': true,
    },
    susm: {
      minimum: 0.0,
      maximum: 274.6,
      'gee:estimated_range': true,
    },
    smp: {
      minimum: 0.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
    ssma: {
      minimum: -4.0,
      maximum: 4.0,
      'gee:estimated_range': true,
    },
    susma: {
      minimum: -4.0,
      maximum: 4.0,
      'gee:estimated_range': true,
    },
  },
  'sci:citation': |||
    **Bolten, J., W.T. Crow, X. Zhan, T.J. Jackson, and C.A. Reynolds (2010).**
    Evaluating the Utility of Remotely Sensed Soil Moisture Retrievals for
    Operational Agricultural Drought Monitoring, *IEEE Transactions on
    Geoscience and Remote Sensing*, 3(1): 57-66.
    [doi:10.1109/JSTARS.2009.2037163](https://doi.org/10.1109/JSTARS.2009.2037163)
    [Google Scholar](https://scholar.google.com/scholar?as_sdt=0%2C21&q=Improved+prediction+of+quasi-global+vegetation+conditions+using+remotely-sensed+surface+soil+moisture%2C+&btnG=)
  |||,
  'sci:publications': [
    {
      citation: |||
        **Bolten, J., and W. T. Crow (2012).** Improved prediction of quasi-global
        vegetation conditions using remotely-sensed surface soil moisture,
        *Geophysical Research Letters*, 39: (L19406).
        [doi:10.1029/2012GL053470](https://doi.org/10.1029/2012GL053470)
        [Google Scholar](https://scholar.google.com/scholar?as_sdt=0%2C21&q=Improved+prediction+of+quasi-global+vegetation+conditions+using+remotely-sensed+surface+soil+moisture%2C+&btnG=)
      |||,
      doi: '10.1029/2012GL053470',
    },
    {
      citation: |||
        **I. E. Mladenova, J.D. Bolten, W.T. Crow, M.C. Anderson, C.R. Hain,
        D.M. Johnson, R. Mueller (2017).** Intercomparison of Soil Moisture,
        Evaporative Stress, and Vegetation Indices for Estimating Corn and Soybean
        Yields Over the U.S., *IEEE Journal of Selected Topics in Applied Earth
        Observations and Remote Sensing*, 10(4): 1328-1343,
        [doi:10.1109/JSTARS.2016.2639338](https://doi.org/10.1109/JSTARS.2016.2639338)
      |||,
      doi: '10.1109/JSTARS.2016.2639338',
    },
    {
      citation: |||
        **Sazib, N., I. E. Mladenova, J.D. Bolten (2018).** Leveraging the Google Earth Engine for Drought Assessment Using Global Soil Moisture Data. *Remote Sensing*, 10(8), p.1265.
        [doi:10.3390/rs10081265](https://doi.org/10.3390/rs10081265)
        [Google Scholar](https://scholar.google.com/scholar_lookup?title=Leveraging%20the%20Google%20Earth%20Engine%20for%20Drought%20Assessment%20Using%20Global%20Soil%20Moisture%20Data&author=N.%20Sazib&author=I.%20Mladenova&author=J.%20Bolten&journal=Remote%20Sens&volume=10&issue=8&pages=1265&publication_year=2018)
      |||,
      doi: '10.3390/rs10081265',
    },
    {
      citation: |||
        **Kerr, Y. H., and D. Levine (2008).** Forward to the special issue on
        the Soil Moisture and Ocean Salinity (SMOS) mission, *IEEE Transactions
        on Geoscience and Remote Sensing*, 46(3): 583-585.
        [doi:10.1109/TGRS.2008.917807](https://doi.org/10.1109/TGRS.2008.917807)
        [Google Scholar](https://scholar.google.com/scholar?as_sdt=0%2C21&q=Forward+to+the+special+issue+on+the+Soil+Moisture+and+Ocean+Salinity+%28SMOS%29+mission&btnG=)
      |||,
      doi: '10.1109/TGRS.2008.917807',
    },
  ],
  'gee:interval': {
    type: 'cadence',
    unit: 'day',
    interval: 3,
  },
  'gee:terms_of_use': |||
    This dataset is in the public domain and is available
    without restriction on use and distribution. See [NASA's
    Earth Science Data & Information Policy](https://science.nasa.gov/earth-science/earth-science-data/data-information-policy)
    for additional information.
  |||,
  'gee:user_uploaded': true,
  version: 'Unknown',
}
