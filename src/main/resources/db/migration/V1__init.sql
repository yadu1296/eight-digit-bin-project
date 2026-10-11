-- Initial schema for the eight-digit-bin project.
-- Table name adapted from the original card_range definition.

DROP TABLE IF EXISTS public.eight_digit_bin;

CREATE TABLE IF NOT EXISTS public.eight_digit_bin
(
    id                   TEXT      NOT NULL,
    bin_range_from       BIGINT,
    bin_range_to         BIGINT,
    scheme_brand         TEXT,
    issuer               TEXT,
    allow_card           BOOLEAN,
    allow_instant_refund BOOLEAN,
    country_of_issue     TEXT,
    currency             TEXT,
    date_added           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_updated         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_name            TEXT,
    CONSTRAINT eight_digit_bin_pk PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS eight_digit_bin_bin_range_from_idx
    ON public.eight_digit_bin USING btree (bin_range_from);

CREATE INDEX IF NOT EXISTS eight_digit_bin_bin_range_to_idx
    ON public.eight_digit_bin USING btree (bin_range_to);

CREATE INDEX IF NOT EXISTS eight_digit_bin_scheme_brand_idx
    ON public.eight_digit_bin USING btree (scheme_brand);

CREATE INDEX IF NOT EXISTS eight_digit_bin_issuer_idx
    ON public.eight_digit_bin USING btree (issuer);

CREATE INDEX IF NOT EXISTS eight_digit_bin_allow_card_idx
    ON public.eight_digit_bin USING btree (allow_card);

CREATE INDEX IF NOT EXISTS eight_digit_bin_allow_instant_refund_idx
    ON public.eight_digit_bin USING btree (allow_instant_refund);

CREATE INDEX IF NOT EXISTS eight_digit_bin_country_of_issue_idx
    ON public.eight_digit_bin USING btree (country_of_issue);

CREATE INDEX IF NOT EXISTS eight_digit_bin_currency_idx
    ON public.eight_digit_bin USING btree (currency);

ALTER TABLE public.eight_digit_bin
    ADD CONSTRAINT uq_eight_digit_bin_bin_range
    UNIQUE (bin_range_from, bin_range_to);
