## Info

> Nominatim (from the Latin, 'by name') is a tool to search OSM data by name and address (geocoding) and to generate synthetic addresses of OSM points (reverse geocoding). It can be found at nominatim.openstreetmap.org.

## Build vagrant boxes

You must have installed `packer`.
Run `packer build box.json`
After finished file `output-vagrant/package.box` will be created.
You can add this box to vagrant by running:
`vagrant box add monaco output-vagrant/package.box`
Then you can use this box:
`vagrant init monaco`

Other osm.pbf files are available at [https://download.geofabrik.de/](https://download.geofabrik.de/)

More info about nominatim - [http://nominatim.org/release-docs/latest/](http://nominatim.org/release-docs/latest/)

## Vagrant Cloud boxes

Currently to Vagrant Cloud are pushed only regions:
* [Monaco](https://app.vagrantup.com/morawskim/boxes/nominatim-monaco)
* [Poland](https://app.vagrantup.com/morawskim/boxes/nominatim-poland)

Example of Vagrantfile
``` ruby
Vagrant.configure("2") do |config|
  config.vm.box = "morawskim/nominatim-poland"
end
```

### Multiple Regions

Information how build nominatim with many regions, is avaiable at BigBinary blog - https://blog.bigbinary.com/2018/08/21/setting-up-a-high-performance-geocoder.html#merging-multiple-regions
