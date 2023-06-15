# LTKTask

# Requirements
1. Build a feed of full-width images that are consumed from a production API.
    * All of our images are in an aspect ratio that supports an edge-to-edge (full-width) UI. So, no worries there.
    * The feed should support pagination (using the info provided in the meta field of the response)

2. When a user taps on one of the full-width images, then a detail view should be pushed onto the view stack. The detail view should contain product images, the hero image, and the profile picture.
    * All of this information is returned from the API. To relate the different models together (ltk, product, and profile), take a look at the JSON that is returned. There are top-level lists for each of these. The ltk has a list of associated product_ids and an associated profile_id.

3. When a user taps on one of the product images, then the associated products.hyperlink should resolve in a WebView (either in safari or in the app itself).

4. To power the above requirements, you’ll consume the following public API: https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/?featured=true&limit=20
