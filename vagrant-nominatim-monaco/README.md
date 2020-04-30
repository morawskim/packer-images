## Info

> Nominatim (from the Latin, 'by name') is a tool to search OSM data by name and address (geocoding) and to generate synthetic addresses of OSM points (reverse geocoding). It can be found at nominatim.openstreetmap.org.

## Build vagrant box

You must have installed `packer`.
Run `packer build box.json`
After finished file `output-vagrant/package.box` will be created.
You can add this box to vagrant by running:
`vagrant box add monaco output-vagrant/package.box`
Then you can use this box:
`vagrant init monaco`

Other osm.pbf files are available at https://download.geofabrik.de/

More info about nominatim - http://nominatim.org/release-docs/latest/

### Multiple Regions

Information how build nominatim with many regions, is avaiable at BigBinary blog - https://blog.bigbinary.com/2018/08/21/setting-up-a-high-performance-geocoder.html#merging-multiple-regions
