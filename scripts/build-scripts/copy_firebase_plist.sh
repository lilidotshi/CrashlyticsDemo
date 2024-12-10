#########################################
# This script is used as part of the    #
# build phases portion in the DemoApp   #
# and should not be run by itself.      #
#########################################

# Name of the resource we're selectively copying
GOOGLESERVICE_INFO_PLIST=GoogleService-Info.plist

# Get references to dev and prod versions of the GoogleService-Info.plist
# NOTE: These should only live on the file system and should NOT be part of the target (since we'll be adding them to the target manually)
GOOGLESERVICE_INFO_DEV=${SRCROOT}/ConfigurationFiles/development/${GOOGLESERVICE_INFO_PLIST}

# Make sure the dev version of GoogleService-Info.plist exists
echo "Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_DEV}"
if [ ! -f $GOOGLESERVICE_INFO_DEV ]
then
    echo "No Development GoogleService-Info.plist found. Please ensure it's in the proper directory."
    exit 1
fi

PLIST_DESTINATION=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app

# Get a reference to the destination location for the GoogleService-Info.plist
echo "Will copy ${GOOGLESERVICE_INFO_PLIST} to final destination: ${PLIST_DESTINATION}"

# Copy over the debug GoogleService-Info.plist for Debug builds
if [ "${CONFIGURATION}" == "Debug" ]
then
    echo "Using ${GOOGLESERVICE_INFO_DEV}"
    echo $(cp -fv "${GOOGLESERVICE_INFO_DEV}" "${PLIST_DESTINATION}")
fi
