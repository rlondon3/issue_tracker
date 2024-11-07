import * as React from 'react';
import Breadcrumbs from '@mui/material/Breadcrumbs';
import Link from '@mui/material/Link';


export default function Navigation() {
  return (
    <div role="presentation">
      <Breadcrumbs aria-label="breadcrumb">
        <Link underline="hover" color="inherit" href="https://github.com/rlondon3/issue_tracker">
          Github
        </Link>
        <Link
          underline="hover"
          color="inherit"
          href="https://ralphscloudresume.com"
        >
          Contact
        </Link>
        <Link sx={{ color: 'text.primary' }}
            href="https://programmingthestreets.hashnode.dev/grand-hustle-upskillin-with-ruby"
        >
            Blog
        </Link>
      </Breadcrumbs>
    </div>
  );
}
