rule win_satana_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.satana."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.satana"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { ff15???????? 8b75fc 668945ee 6a10 8d45ec 50 56 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   668945ee             | mov                 word ptr [ebp - 0x12], ax
            //   6a10                 | push                0x10
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_1 = { 68???????? e8???????? 83c408 57 ff15???????? 57 }
            // n = 6, score = 100
            //   68????????           |                     
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   57                   | push                edi
            //   ff15????????         |                     
            //   57                   | push                edi

        $sequence_2 = { 68???????? 68???????? 8d85e0deffff 68???????? 50 }
            // n = 5, score = 100
            //   68????????           |                     
            //   68????????           |                     
            //   8d85e0deffff         | lea                 eax, [ebp - 0x2120]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_3 = { 83c002 663bcb 75f1 8d8de89effff }
            // n = 4, score = 100
            //   83c002               | add                 eax, 2
            //   663bcb               | cmp                 cx, bx
            //   75f1                 | jne                 0xfffffff3
            //   8d8de89effff         | lea                 ecx, [ebp - 0x6118]

        $sequence_4 = { 8b45ec 0fb64c03fb 51 68???????? e8???????? }
            // n = 5, score = 100
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   0fb64c03fb           | movzx               ecx, byte ptr [ebx + eax - 5]
            //   51                   | push                ecx
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_5 = { 6800080000 6a08 52 03df ff15???????? }
            // n = 5, score = 100
            //   6800080000           | push                0x800
            //   6a08                 | push                8
            //   52                   | push                edx
            //   03df                 | add                 ebx, edi
            //   ff15????????         |                     

        $sequence_6 = { 8b75e4 8b0d???????? 56 6a08 51 }
            // n = 5, score = 100
            //   8b75e4               | mov                 esi, dword ptr [ebp - 0x1c]
            //   8b0d????????         |                     
            //   56                   | push                esi
            //   6a08                 | push                8
            //   51                   | push                ecx

        $sequence_7 = { 6a07 8d8dfcefffff 68???????? 51 ffd7 83c43c }
            // n = 6, score = 100
            //   6a07                 | push                7
            //   8d8dfcefffff         | lea                 ecx, [ebp - 0x1004]
            //   68????????           |                     
            //   51                   | push                ecx
            //   ffd7                 | call                edi
            //   83c43c               | add                 esp, 0x3c

        $sequence_8 = { 33c0 8d4900 0fb788a8404100 66898c05d87effff 83c002 6685c9 75e9 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   8d4900               | lea                 ecx, [ecx]
            //   0fb788a8404100       | movzx               ecx, word ptr [eax + 0x4140a8]
            //   66898c05d87effff     | mov                 word ptr [ebp + eax - 0x8128], cx
            //   83c002               | add                 eax, 2
            //   6685c9               | test                cx, cx
            //   75e9                 | jne                 0xffffffeb

        $sequence_9 = { 8d8dfcefffff 68???????? 51 ffd7 83c43c 803e00 }
            // n = 6, score = 100
            //   8d8dfcefffff         | lea                 ecx, [ebp - 0x1004]
            //   68????????           |                     
            //   51                   | push                ecx
            //   ffd7                 | call                edi
            //   83c43c               | add                 esp, 0x3c
            //   803e00               | cmp                 byte ptr [esi], 0

    condition:
        7 of them and filesize < 221184
}