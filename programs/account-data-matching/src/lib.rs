use anchor_lang::prelude::*;

declare_id!("GNAx7Bnrdd8xVkd4ZzHeCeQutpAA39yreNAghryf4WqK");

/**
 * INFORMATIONAL SEVERITY:
 * --------------------------------
 * The `update_admin` function accepts an `authority` signer in its context; however, it does not perform
 * any explicit access control checks to verify that this signer is indeed authorized to update the admin state.
 *
 * While this behavior might be intentional based on the application's design, it is recommended to review
 * the access control logic to ensure that only the intended authority can perform admin updates.
 * --------------------------------
 */

#[program]
pub mod accountData_matching {
    use super::*;

    pub fn update_admin(ctx: Context<UpdateAdmin>, new_admin: Pubkey) -> Result<()> {
        ctx.accounts.admin_state.admin = new_admin;
        Ok(())
    }
}

#[derive(Accounts)]
pub struct UpdateAdmin<'info> {
    #[account(mut)]
    pub admin_state: Account<'info, AdminState>,
    pub authority: Signer<'info>,
}

#[account]
#[derive(Default)]
pub struct AdminState {
    pub admin: Pubkey,
}
