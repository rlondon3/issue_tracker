import React from "react";
import "./styles/globals.css";
import { AppRouterCacheProvider } from '@mui/material-nextjs/v15-appRouter';
import { ThemeProvider } from '@mui/material/styles';
import theme from './theme/theme';
import { Roboto } from 'next/font/google';

const roboto = Roboto({
    weight: ['300', '400', '500', '700'],
    subsets: ['latin'],
    display: 'swap',
    variable: '--font-roboto',
  });

 export default function RootLayout({ children }: React.PropsWithChildren) {
   return (
     <html lang="en">
       <body>
       <AppRouterCacheProvider>
           <ThemeProvider theme={theme}>
              {children}
            </ThemeProvider>
          </AppRouterCacheProvider>
       </body>
     </html>
   );
 }

