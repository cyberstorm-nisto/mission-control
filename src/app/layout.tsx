import type { Metadata } from 'next';
import { JetBrains_Mono } from 'next/font/google';
import './globals.css';

const jetbrainsMono = JetBrains_Mono({ subsets: ['latin'], weight: ['400', '500', '600', '700'], variable: '--font-jetbrains' });

export const metadata: Metadata = {
  title: 'Mission Control',
  description: 'AI Agent Orchestration Dashboard',
  icons: {
    icon: '/favicon.svg',
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={`bg-mc-bg text-mc-text min-h-screen ${jetbrainsMono.variable}`}>{children}</body>
    </html>
  );
}
