import * as React from 'react';
import ButtonGroup from '@mui/material/ButtonGroup';
import Box from '@mui/material/Box';
import Link from '@mui/material/Link';
import Button from '@mui/material/Button';

export default function Navigation() {
	return (
		<Box
			sx={{
				display: 'flex',
				flexDirection: 'column',
				alignItems: 'center',
				'& > *': {
					m: 1,
				},
			}}
		>
			<ButtonGroup
				variant='text'
				aria-label='Basic button group'
			>
				<Button>
					<Link
						underline='hover'
						color='inherit'
						href='https://github.com/rlondon3/issue_tracker'
					>
						Github
					</Link>
				</Button>
				<Button>
					<Link
						underline='hover'
						color='inherit'
						href='https://ralphscloudresume.com'
					>
						Contact
					</Link>
				</Button>
				<Button>
					<Link
						sx={{ color: 'text.primary' }}
						href='https://programmingthestreets.hashnode.dev/grand-hustle-upskillin-with-ruby'
					>
						Blog
					</Link>
				</Button>
			</ButtonGroup>
		</Box>
	);
}
