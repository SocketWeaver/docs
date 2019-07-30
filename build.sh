(
    cd SWNetwork
    mkdocs build
)
mv SWNetwork/site . && mv site docs
# mv docs oldDocs && mv SWNetwork/site docs && rm -rf oldDocs