#!/usr/bin/env bash


version=${1}

capiversion=$(git -C /Users/pivotal/workspace/cf-deployment show $version:cf-deployment.yml | grep capi-release?v= | cut -d'=' -f2)
ccversion=$(git -C /Users/pivotal/workspace/capi-release ls-tree ${capiversion} src/cloud_controller_ng | awk '{print $3}')
apiversion=$(git -C /Users/pivotal/workspace/capi-release/src/cloud_controller_ng show ${ccversion}:config/version_v2)

#echo $ccversion
#echo $apiversion

echo "{\"CF_VERSION\": \"$(echo ${version} | cut -c 2-)\", \"CC_SHA\": \"${ccversion}\", \"CC_API_VERSION\": \"${apiversion}\"},"
