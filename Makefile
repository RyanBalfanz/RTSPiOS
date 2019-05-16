default: build_dist

2019-04-08-raspbian-stretch-lite.zip:
	# curl --location --remote-name https://downloads.raspberrypi.org/raspbian_lite_latest
	curl --location --remote-name http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip

raspbian_latest_image: 2019-04-08-raspbian-stretch-lite.zip
	shasum --algorithm 256 2019-04-08-raspbian-stretch-lite.zip
	# 03ec326d45c6eb6cef848cf9a1d6c7315a9410b49a276a6b28e67a40b11fdfcf

build_dist:
	time docker-compose run custompios
