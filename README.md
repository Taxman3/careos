# careos (site)

The careOS landing page: plain HTML and CSS, no build step, no scripts, no tracking. Hosted on GitHub Pages.

## Files

| File | What it is |
|---|---|
| `index.html` | The page |
| `styles.css` | All styling (system fonts, no external requests) |
| `404.html` | "Page not found" page (GitHub Pages serves it automatically) |
| `favicon.svg` | Browser tab icon |
| `img/` | Demo screenshots (patient details blurred) |
| `og-image.png` | 1200×630 preview shown when the link is shared on WhatsApp, Facebook, LinkedIn or X |
| `og/og-image.html`, `og/render.ps1` | Source of the preview image; edit the HTML, then run `powershell -File og\render.ps1` |
| `CNAME` | The custom domain for GitHub Pages |
| `robots.txt`, `sitemap.xml` | For search engines |
| `.nojekyll` | Tells GitHub Pages to serve the files as they are |

## Before publishing: the TODO list

Search the files for `TODO`:

1. **Domain.** Done: `careos.company` (Name.com, free first year, renews 24 Nov 2027 at about $25).
2. **Demo address.** Done: `https://demo.careos.company` (named Cloudflare tunnel `careos-demo`, run by the demo service).
3. **WhatsApp number.** Done: 0707 270 029.
4. **Phone number.** Done: 0707 270 029.
5. **Email.** The site shows your Gmail for now. Once the domain is set up you can switch to `hello@careos.company`
   with Cloudflare Email Routing (free; it forwards to the Gmail inbox).
6. **Screenshots.** Done: `img/patients.png`, `img/billing.png` (demo screens, names and
   personal details blurred). To replace one, keep it under about 200 KB and blur anything that identifies a patient.

## Publish on GitHub Pages

1. On GitHub, create a public repository (done: `Taxman3/careos`).
2. In this folder:
   ```
   git remote add origin https://github.com/Taxman3/careos.git
   git push -u origin main
   ```
3. Repository **Settings → Pages**: Source **Deploy from a branch**, branch **main**, folder **/ (root)**. Save.
4. Same page, **Custom domain**: `careos.company`. Save. GitHub shows the DNS records it needs.
5. In **Cloudflare → DNS** (not at the registrar, because Cloudflare runs the domain), add the records, each set to
   **DNS only** (grey cloud):
   - four `A` records for `careos.company`: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - `CNAME` `www` → `taxman3.github.io`
   Keep the `demo` record that the tunnel creates; it is separate.
6. Back in **Settings → Pages**, tick **Enforce HTTPS** once the domain check passes (minutes to a few hours).
7. Test the link preview by pasting `https://careos.company` into a WhatsApp chat with yourself.

## Rules for the content

- No real patient data, real hospital names or screenshots of real patients.
- No claims of certification or compliance: write "designed toward" or "in line with".
- No invented testimonials, statistics, customer logos or prices.
