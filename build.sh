(
    cd SWNetwork
    mkdocs build
)
rm -rf docs && mv SWNetwork/site . && mv site docs
