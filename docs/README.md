# LearnVestor GitHub Pages Website

This directory contains the static website for LearnVestor that will be hosted on GitHub Pages.

## 🌐 Live Website

Once deployed, the website will be available at: `https://salvaferreira.github.io/LearnVestor/`

## 📁 Structure

```
docs/
├── index.html          # Main landing page
├── privacy.html        # Privacy policy
├── terms.html          # Terms of service
├── disclaimer.html     # Investment disclaimer
├── styles.css          # Main stylesheet
├── script.js           # JavaScript functionality
└── assets/             # Images and media files
    ├── logo.png        # LearnVestor logo
    ├── hero-phone.png  # Hero section phone mockup
    ├── screenshot-*.png # App screenshots
    ├── google-play.png # Google Play badge
    ├── app-store.png   # App Store badge
    └── tech/           # Technology logos
        ├── flutter.svg
        ├── dart.svg
        ├── supabase.svg
        └── ...
```

## 🚀 Setting Up GitHub Pages

### 1. Enable GitHub Pages

1. Go to your repository settings on GitHub
2. Scroll down to "Pages" section
3. Under "Source", select "Deploy from a branch"
4. Choose "main" branch and "/docs" folder
5. Click "Save"

### 2. Domain Configuration (Optional)

If you want to use a custom domain:
1. Add a `CNAME` file to the docs folder with your domain
2. Configure DNS settings with your domain provider
3. Update the domain in repository settings

### 3. Adding Required Assets

You'll need to add the following images to the `assets/` folder:

#### Required Images:
- `logo.png` - LearnVestor logo (32x32px recommended)
- `hero-phone.png` - Phone mockup for hero section
- `og-image.jpg` - Open Graph image for social sharing (1200x630px)
- `screenshot-home.png` - Home screen screenshot
- `screenshot-lessons.png` - Lessons page screenshot
- `screenshot-portfolio.png` - Portfolio page screenshot
- `screenshot-explore.png` - Explore page screenshot
- `google-play.png` - Google Play store badge
- `app-store.png` - App Store badge

#### Technology Logos:
- `tech/flutter.svg`
- `tech/dart.svg`
- `tech/supabase.svg`
- `tech/firebase.svg`
- `tech/finnhub.svg`
- `tech/material.svg`

### 4. Creating Screenshots

To create app screenshots:
1. Use your Flutter app's debug/release builds
2. Take screenshots on different devices/screen sizes
3. Consider using tools like `flutter drive` for automated screenshots
4. Optimize images for web (compress and resize as needed)

### 5. Customization

#### Update Content:
- Modify `index.html` to match your app's features
- Update contact information and links
- Customize the color scheme in `styles.css`
- Add your own branding and messaging

#### Update Links:
- Replace GitHub repository links
- Update download links when your app is published
- Add your social media links
- Update contact email addresses

## 📱 Features

The website includes:

- **Responsive Design**: Works on desktop, tablet, and mobile
- **Modern UI**: Clean, professional design with animations
- **SEO Optimized**: Meta tags, Open Graph, and structured data
- **Accessibility**: Semantic HTML and keyboard navigation
- **Performance**: Optimized CSS and JavaScript
- **Legal Pages**: Privacy policy, terms of service, and investment disclaimer

## 🎨 Customization Tips

### Colors:
The main brand colors are defined in CSS variables:
```css
:root {
    --primary-color: #F3518A;
    --primary-dark: #E63E82;
    --secondary-color: #667eea;
    --accent-color: #764ba2;
}
```

### Fonts:
The site uses Inter font from Google Fonts. You can change this in the HTML head section.

### Layout:
The site uses CSS Grid and Flexbox for layout. It's fully responsive and adapts to different screen sizes.

## 🔧 Local Development

To test the website locally:

1. Use a simple HTTP server:
```bash
# Python 3
python -m http.server 8000

# Node.js (if you have http-server installed)
npx http-server .

# VS Code Live Server extension
# Right-click index.html and select "Open with Live Server"
```

2. Open `http://localhost:8000` in your browser

## 📊 Analytics (Optional)

To add Google Analytics:
1. Get a Google Analytics tracking ID
2. Add the tracking code to the `<head>` section of each HTML file
3. Update the `trackDownload()` function in `script.js`

## 🔍 SEO Considerations

The website includes:
- Meta descriptions and keywords
- Open Graph tags for social sharing
- Structured data markup
- Semantic HTML structure
- Fast loading times
- Mobile-friendly design

## 📞 Support

If you need help setting up the website:
1. Check GitHub Pages documentation
2. Review the GitHub repository for any issues
3. Test the website locally first
4. Ensure all image assets are properly added

## 🚨 Important Notes

- The website emphasizes that LearnVestor is educational only
- All legal disclaimers are included
- Investment warnings are prominently displayed
- Contact information should be updated to your actual details
- Download links need to be updated when your app is published

Remember to test the website thoroughly before making it live, and ensure all links and contact information are correct!
