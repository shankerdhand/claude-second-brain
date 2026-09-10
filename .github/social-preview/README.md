# Social preview

`social-preview.png` (1280×640) is the repo's link-preview image, set in
**Settings → General → Social preview**. `preview.html` is its source.

To change it, edit `preview.html`, then re-render from this folder:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,640 --virtual-time-budget=8000 \
  --screenshot="$PWD/social-preview.png" "file://$PWD/preview.html"
```

Upload the new PNG in the repo settings again. GitHub has no API for this.
