use anchor_lang::prelude::*;

declare_id!("GNAx7Bnrdd8xVkd4ZzHeCeQutpAA39yreNAghryf4WqK");

/**
 * INFORMATIONAL SEVERITY:
 * --------------------------------
 * The `update_admin` instruction only checks that the `authority` is a signer, but it does not verify that
 * the signer is the current admin stored in the `admin_account`. This omission can allow any valid signer
 * to update the admin, potentially leading to unauthorized changes in ownership.
 *
 * Although the unchecked accounts are marked intentionally for demonstration purposes, it is recommended
 * to implement a proper owner verification check in production to ensure that only the current admin can
 * update the admin state.
 * --------------------------------
 */
#[program]
pub mod missing_owner_check {
    use super::*;

    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        let admin_state = &mut ctx.accounts.admin_account;
        admin_state.admin = *ctx.accounts.authority.key;
        msg!("Initialized admin: {:?}", ctx.accounts.authority.key);
        Ok(())
    }

    pub fn update_admin(ctx: Context<UpdateAdmin>) -> Result<()> {
        let admin_state = &mut ctx.accounts.admin_account;
        require!(ctx.accounts.authority.is_signer, ErrorCode::SignerRequired);
        admin_state.admin = *ctx.accounts.new_admin.key;
        msg!("Admin updated to: {:?}", ctx.accounts.new_admin.key);
        Ok(())
    }
}

#[account]
#[derive(Default, Debug)]
pub struct AdminState {
    pub admin: Pubkey,
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    #[account(init, payer = authority, space = 8 + 32 + 8)]
    pub admin_account: Account<'info, AdminState>,
    #[account(mut)]
    pub authority: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct UpdateAdmin<'info> {
    #[account(mut)]
    pub admin_account: Account<'info, AdminState>,
    // / CHECK: This account is intentionally unchecked for signature to simulate a missing signer vulnerability.
    pub authority: Signer<'info>,
    /// CHECK: This account is intentionally unchecked for signature to simulate a missing signer vulnerability.
    pub new_admin: AccountInfo<'info>,
}

#[error_code]
pub enum ErrorCode {
    #[msg("The authority must be a signer")]
    SignerRequired,
}
