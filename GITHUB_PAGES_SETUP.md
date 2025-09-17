# 🌐 Setting Up GitHub Pages for LearnVestor

This guide will help you deploy your LearnVestor website to GitHub Pages.

## 🚀 Quick Setup (5 minutes)

### Step 1: Enable GitHub Pages

1. Go to your GitHub repository: `https://github.com/SalvaFerreira/LearnVestor`
2. Click on **Settings** tab
3. Scroll down to **Pages** in the left sidebar
4. Under **Source**, select "Deploy from a branch"
5. Choose **main** branch and **/docs** folder
6. Click **Save**

### Step 2: Wait for Deployment

- GitHub will automatically build and deploy your site
- This usually takes 1-5 minutes
- You'll see a green checkmark when it's ready
- Your site will be live at: `https://salvaferreira.github.io/LearnVestor/`

### Step 3: Add Your App Screenshots

Replace the placeholder images in `/docs/assets/` with actual screenshots:

```
docs/assets/
├── logo.png              ✅ Already copied from your app
├── hero-phone.png        ❌ Need to add
├── screenshot-home.png   ❌ Need to add  
├── screenshot-lessons.png ❌ Need to add
├── screenshot-portfolio.png ❌ Need to add
├── screenshot-explore.png ❌ Need to add
├── google-play.png       ❌ Need to add (when published)
└── app-store.png         ❌ Need to add (when published)
```

## 📱 Creating App Screenshots

### Method 1: Flutter Screenshots
```bash
# In your Flutter project directory
flutter drive --target=test_driver/screenshot.dart

# Or manually take screenshots in simulator/device
# Android Studio: Tools > Device File Explorer > Screenshots
# Xcode: Device > Screenshot
```

### Method 2: Using Browser Dev Tools
```bash
# Run Flutter web version
flutter run -d chrome

# Use browser dev tools to simulate mobile
# Take screenshots at different breakpoints
```

### Method 3: Physical Device
1. Run your app on a real device
2. Take screenshots using device buttons
3. Transfer images to your computer
4. Resize and optimize for web

## 🎨 Customizing Your Website

### Update Content

Edit `docs/index.html` to customize:
- App description and features
- Download links (when your app is published)
- Contact information
- Social media links

### Update Colors

Edit `docs/styles.css` to change the brand colors:
```css
:root {
    --primary-color: #F3518A;  /* Your app's primary color */
    --secondary-color: #667eea; /* Secondary accent color */
    /* ... other colors */
}
```

### Update Links

Replace placeholder links in the HTML files:
- GitHub repository links ✅ Already set
- Download store links ❌ Update when published
- Contact emails ❌ Replace with your actual email
- Social media links ❌ Add your social profiles

## 📧 Email Setup

The website includes these email addresses that you should set up:
- `privacy@learnvestor.app` - Privacy policy inquiries
- `legal@learnvestor.app` - Terms of service
- `education@learnvestor.app` - Investment disclaimer

You can:
1. Set up these emails with your domain
2. Or replace them with your personal/business email
3. Or use GitHub issues for support instead

## 🔗 When Your App is Published

### Google Play Store
1. Get your Google Play store URL
2. Download the official Google Play badge
3. Update the download link in `index.html`
4. Add the badge image to `assets/google-play.png`

### Apple App Store  
1. Get your App Store URL
2. Download the official App Store badge
3. Update the download link in `index.html`
4. Add the badge image to `assets/app-store.png`

## 🔍 SEO and Analytics

### Google Analytics (Optional)
```html
<!-- Add to <head> section of all HTML files -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_TRACKING_ID');
</script>
```

### Google Search Console
1. Verify your site ownership
2. Submit your sitemap: `https://salvaferreira.github.io/LearnVestor/sitemap.xml`
3. Monitor search performance

## 🛠 Testing Your Website

### Local Testing
```bash
# Navigate to docs folder
cd docs

# Start a local server
python -m http.server 8000
# Or use VS Code Live Server extension

# Open browser
open http://localhost:8000
```

### Mobile Testing
- Use browser dev tools to test responsive design
- Test on actual mobile devices
- Check loading speed and performance

### Cross-Browser Testing
- Chrome/Chromium
- Firefox  
- Safari
- Edge

## 🚨 Common Issues and Solutions

### Issue: Images not loading
**Solution**: Check file paths and ensure images are in the correct `assets/` folder

### Issue: GitHub Pages not updating
**Solution**: 
1. Check the Actions tab for build errors
2. Wait 5-10 minutes for changes to propagate
3. Hard refresh your browser (Ctrl+Shift+R)

### Issue: Mobile layout broken
**Solution**: Test responsive design and update CSS media queries

### Issue: Slow loading
**Solution**: 
1. Optimize and compress images
2. Minimize CSS and JavaScript
3. Use appropriate image formats (WebP, SVG)

## 📊 Website Features

Your LearnVestor website includes:

✅ **Professional Landing Page**
- Hero section with app showcase
- Feature highlights
- How it works section
- App screenshots gallery
- Technology stack display
- Download section

✅ **Legal Pages**
- Privacy Policy
- Terms of Service  
- Investment Disclaimer

✅ **Responsive Design**
- Mobile-friendly
- Tablet optimized
- Desktop experience

✅ **SEO Optimized**
- Meta tags
- Open Graph tags
- Structured data
- Fast loading

✅ **Interactive Elements**
- Smooth scrolling
- Hover animations
- Mobile navigation
- Form handling

## 🎯 Next Steps

1. **Immediate**: Add your app screenshots
2. **Before launch**: Update all contact information
3. **At launch**: Add real download links
4. **Post-launch**: Set up analytics and monitoring
5. **Ongoing**: Keep content updated with new features

## 📞 Support

If you need help:
1. Check the GitHub Pages documentation
2. Review this guide step-by-step
3. Test locally first before pushing to GitHub
4. Create an issue in your repository for specific problems

Your website will be a professional showcase for LearnVestor that builds trust with potential users and provides all necessary legal information! 🚀
